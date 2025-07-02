import 'package:monthly_common/utils/constants/app_constants.dart';
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

  DateTime getNextMonth(int day) {
    if (month == 12) {
      return DateTime(year + 1, 1, day);
    } else {
      return DateTime(year, month + 1, day);
    }
  }
}
