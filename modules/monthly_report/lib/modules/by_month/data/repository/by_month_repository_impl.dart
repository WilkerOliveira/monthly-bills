import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_report/modules/by_month/domain/entities/monthly_report_entity.dart';
import 'package:monthly_report/modules/by_month/domain/repository/by_month_repository.dart';

class ByMonthRepositoryImpl implements ByMonthRepository {
  ByMonthRepositoryImpl({required RegisterDatabase registerDatabase})
    : _registerDatabase = registerDatabase;

  final RegisterDatabase _registerDatabase;

  @override
  Future<MonthlyReportEntity> getMonthlyReport({
    required int month,
    required int year,
  }) async {
    final result = await _registerDatabase.getByMonth(month, year);

    final bills =
        result.map((bill) => BillModel.toModel(bill).toEntity()).toList();

    return MonthlyReportEntity.fromBills(bills, month, year);
  }
}
