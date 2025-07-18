import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/modules/by_year/domain/entities/year_report_entity.dart';
import 'package:monthly_report/modules/by_year/domain/repository/by_year_repository.dart';

abstract class GetReportByYearUseCase {
  Future<Result<YearReportEntity>> call({required int year});
}

class GetReportByYearUseCaseImpl implements GetReportByYearUseCase {
  GetReportByYearUseCaseImpl({required this.byYearRepository});

  final ByYearRepository byYearRepository;

  @override
  Future<Result<YearReportEntity>> call({required int year}) async {
    try {
      return Success(await byYearRepository.getYearReport(year: year));
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
