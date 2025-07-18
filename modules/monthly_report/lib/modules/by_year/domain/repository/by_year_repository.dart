import 'package:monthly_report/modules/by_year/domain/entities/year_report_entity.dart';

abstract class ByYearRepository {
  Future<YearReportEntity> getYearReport({required int year});
}
