import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_report/modules/by_year/domain/entities/year_report_entity.dart';
import 'package:monthly_report/modules/by_year/domain/repository/by_year_repository.dart';

class ByYearRepositoryImpl implements ByYearRepository {
  ByYearRepositoryImpl({required RegisterDatabase registerDatabase})
    : _registerDatabase = registerDatabase;

  final RegisterDatabase _registerDatabase;

  @override
  Future<YearReportEntity> getYearReport({required int year}) async {
    final result = await _registerDatabase.getByYear(year);

    final bills =
        result.map((bill) => BillModel.toModel(bill).toEntity()).toList();

    return YearReportEntity.fromBills(bills, year);
  }
}
