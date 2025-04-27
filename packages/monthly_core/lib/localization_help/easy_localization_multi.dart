import 'dart:async';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:monthly_common/monthly_common.dart';

class MultiAssetLoader extends AssetLoader {
  const MultiAssetLoader(this.loaders);
  final List<BaseLoader> loaders;

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    final allTranslations = <String, dynamic>{};

    for (final loader in loaders) {
      final translations = await loader.load(path, locale);
      allTranslations.addAll(translations);
    }

    return allTranslations;
  }
}
