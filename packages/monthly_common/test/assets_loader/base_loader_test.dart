import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monthly_common/assets_loader/base_loader.dart';

class MockAssetBundle extends Mock implements AssetBundle {}

class TestLoader extends BaseLoader {
  TestLoader(super.packageName, this._assetBundle);

  final AssetBundle _assetBundle;

  @override
  String getAssetPath(String localePath) => 'assets/$localePath.json';

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    try {
      final localePath = locale.toString();
      final fullPath = getAssetPath(localePath);
      final data = await _assetBundle.loadString(fullPath);
      final result = json.decode(data) as Map<String, dynamic>;
      return {packageName: result};
    } on Exception catch (_) {
      return {};
    }
  }
}

void main() {
  setUpAll(() {
    registerFallbackValue(Uri());
  });

  group('BaseLoader', () {
    late MockAssetBundle mockAssetBundle;
    late TestLoader loader;

    setUp(() {
      mockAssetBundle = MockAssetBundle();
      loader = TestLoader('test_package', mockAssetBundle);
    });

    test('returns namespaced map on success', () async {
      const locale = Locale('en');
      const assetPath = 'assets/en.json';
      final jsonString = json.encode({'hello': 'world'});

      when(
        () => mockAssetBundle.loadString(assetPath),
      ).thenAnswer((_) async => jsonString);

      final result = await loader.load('', locale);

      expect(result, {
        'test_package': {'hello': 'world'},
      });
      verify(() => mockAssetBundle.loadString(assetPath)).called(1);
    });

    test('returns empty map on exception', () async {
      const locale = Locale('en');
      const assetPath = 'assets/en.json';

      when(
        () => mockAssetBundle.loadString(assetPath),
      ).thenThrow(Exception('Failed to load'));

      final result = await loader.load('', locale);

      expect(result, <String, dynamic>{});
      verify(() => mockAssetBundle.loadString(assetPath)).called(1);
    });

    test('getAssetPath returns correct path', () {
      expect(loader.getAssetPath('en'), 'assets/en.json');
    });
  });
}
