import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/modules/by_month/domain/entities/monthly_report_entity.dart';
import 'package:monthly_report/modules/by_month/domain/repository/by_month_repository.dart';

abstract class GetReportByMonthUseCase {
  Future<Result<MonthlyReportEntity>> call({
    required int month,
    required int year,
  });
}

class GetReportByMonthUseCaseImpl implements GetReportByMonthUseCase {
  GetReportByMonthUseCaseImpl({required this.byMonthRepository});

  final ByMonthRepository byMonthRepository;

  @override
  Future<Result<MonthlyReportEntity>> call({
    required int month,
    required int year,
  }) async {
    try {
      return Success(
        await byMonthRepository.getMonthlyReport(month: month, year: year),
      );
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
