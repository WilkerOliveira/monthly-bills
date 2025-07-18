import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/modules/by_year/domain/usecases/get_report_by_year_usecase.dart';
import 'package:monthly_report/modules/by_year/presentation/cubit/by_year_state.dart';

class ByYearCubit extends Cubit<ByYearState> {
  ByYearCubit({required this.byYearUseCase}) : super(ByYearInitialState());

  final GetReportByYearUseCase byYearUseCase;

  Future<void> getYearReport({required int year}) async {
    try {
      emit(ByYearLoadingState());
      final yearReport = await byYearUseCase(year: year);

      yearReport.fold(
        (report) {
          if (report.months.isEmpty) {
            emit(ByYearEmptyState());
          } else {
            emit(ByYearLoadedState(yearReportEntity: report));
          }
        },
        (failure) {
          emit(ByYearErrorState());
        },
      );
    } on Exception catch (_) {
      emit(ByYearErrorState());
    }
  }
}
