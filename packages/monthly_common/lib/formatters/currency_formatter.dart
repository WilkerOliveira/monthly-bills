import 'package:monthly_dependencies/monthly_dependencies.dart';

CurrencyTextInputFormatter currencyTextInputFormatter(String locale) {
  if (locale == 'pt_BR') {
    return CurrencyTextInputFormatter.currency(
      locale: 'pt_BR',
      symbol: r'R$',
      decimalDigits: 2,
    );
  }

  return CurrencyTextInputFormatter.currency(
    locale: 'en_US',
    symbol: r'$',
    decimalDigits: 2,
  );
}
