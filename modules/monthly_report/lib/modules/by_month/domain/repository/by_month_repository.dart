import 'package:monthly_report/modules/by_month/domain/entities/monthly_report_entity.dart';

abstract class ByMonthRepository {
  Future<MonthlyReportEntity> getMonthlyReport({
    required int month,
    required int year,
  });
}
