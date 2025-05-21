import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_common/enums/bill_types_enum.dart';
import 'package:monthly_common/extensions/string_extension.dart';

void main() {
  group('StringExtension.replace', () {
    test('replaces all occurrences of replacements with values', () {
      const input = 'Hello, {name}! Welcome to {place}.';
      final result = input.replace(
        ['{name}', '{place}'],
        ['Alice', 'Wonderland'],
      );
      expect(result, 'Hello, Alice! Welcome to Wonderland.');
    });

    test('returns original string if replacements are empty', () {
      const input = 'No replacements here.';
      final result = input.replace([], []);
      expect(result, input);
    });

    test(
      'throws ArgumentError if replacements and values have different lengths',
      () {
        const input = 'Test {a}';
        expect(() => input.replace(['{a}'], []), throwsA(isA<ArgumentError>()));
      },
    );

    test('replaces multiple occurrences', () {
      const input = '{a} and {a}';
      final result = input.replace(['{a}'], ['X']);
      expect(result, 'X and X');
    });
  });

  group('StringExtension.toBillType', () {
    test('returns correct BillTypesEnum for matching string', () {
      expect('electricity'.toBillType(), BillTypesEnum.electricity);
      expect('WATER'.toBillType(), BillTypesEnum.water);
      expect('Internet'.toBillType(), BillTypesEnum.internet);
    });

    test('is case insensitive', () {
      expect('ElEcTrIcItY'.toBillType(), BillTypesEnum.electricity);
    });
  });
}
