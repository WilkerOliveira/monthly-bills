import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

String getMonthName(int month, String locale) {
  final adjustedMonth = (month - 1) % 12 + 1;
  return DateFormat.MMMM(
    locale,
  ).format(DateTime(2000, adjustedMonth)).capitalize();
}
