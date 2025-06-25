import 'package:monthly_common/helpers/constants/app_constants.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

extension DateTimeExtension on DateTime {
  String toLocaleDateFormat(String locale) {
    if (locale == 'pt_BR') {
      return DateFormat(brDateFormat).format(this);
    }
    return DateFormat(usDateFormat).format(this);
  }

  String toDayAndMonthFormat(String locale) {
    if (locale == 'pt_BR') {
      return DateFormat('dd/MM').format(this);
    }
    return DateFormat('MM/dd').format(this);
  }
}
