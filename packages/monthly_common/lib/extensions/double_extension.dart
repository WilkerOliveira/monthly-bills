import 'package:monthly_dependencies/monthly_dependencies.dart';

extension DecimalExtension on double {
  String formatToCurrency(String locale) {
    if (locale == 'pt_BR') {
      return NumberFormat.currency(
        locale: 'pt_BR',
        name: 'BRL',
        symbol: r'R$',
      ).format(this);
    }

    return NumberFormat.currency(locale: 'en_US', symbol: r'$').format(this);
  }
}
