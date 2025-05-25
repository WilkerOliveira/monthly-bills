import 'package:monthly_dependencies/monthly_dependencies.dart';

extension DateTimeExtension on DateTime {
  String toLocaleDateFormat(String locale) {
    if (locale == 'pt_BR') {
      return DateFormat('dd/MM/yyyy').format(this);
    }
    return DateFormat('yyyy/MM/dd').format(this);
  }
}
