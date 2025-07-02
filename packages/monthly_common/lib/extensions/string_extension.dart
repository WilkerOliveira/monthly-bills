import 'package:monthly_common/utils/constants/app_constants.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

extension StringExtension on String {
  String replace(List<String> replacements, List<String> values) {
    if (replacements.length != values.length) {
      throw ArgumentError('Replacements and values must have the same length');
    }

    var result = this;

    for (var i = 0; i < replacements.length; i++) {
      result = result.replaceAll(replacements[i], values[i]);
    }

    return result;
  }

  double parseCurrencyToDouble(String locale) {
    try {
      final format = NumberFormat.simpleCurrency(locale: locale);
      var cleanedString = this;
      if (format.currencySymbol.isNotEmpty &&
          cleanedString.startsWith(format.currencySymbol)) {
        cleanedString =
            cleanedString.substring(format.currencySymbol.length).trim();
      }
      cleanedString = cleanedString.replaceAll(' ', '');

      return format.parse(cleanedString).toDouble();
    } on Exception {
      var cleanedStringForFallback = replaceAll(RegExp(r'[^\d.,]'), '');
      if (locale.contains('pt_BR') || locale.contains('es_')) {
        cleanedStringForFallback = cleanedStringForFallback.replaceAll('.', '');
        cleanedStringForFallback = cleanedStringForFallback.replaceAll(
          ',',
          '.',
        );
      }
      try {
        return double.parse(cleanedStringForFallback);
      } on Exception {
        return 0;
      }
    }
  }

  DateTime? parseToDateTime(String locale) {
    DateFormat? dateFormat;

    if (locale == 'pt_BR') {
      dateFormat = DateFormat(brDateFormat);
    }
    dateFormat = DateFormat(usDateFormat);

    try {
      return dateFormat.parseStrict(this);
    } on Exception {
      return null;
    }
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
