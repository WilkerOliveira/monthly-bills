import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/modules/by_month/domain/usecases/get_report_by_month_usecase.dart';
import 'package:monthly_report/modules/by_month/presentation/cubit/by_month_state.dart';

class ByMonthCubit extends Cubit<ByMonthState> {
  ByMonthCubit({required this.byMonthUsecase}) : super(ByMonthInitialState());

  final GetReportByMonthUseCase byMonthUsecase;

  Future<void> getMonthlyReport({required int month, required int year}) async {
    try {
      emit(ByMonthLoadingState());
      final monthlyReport = await byMonthUsecase(month: month, year: year);

      monthlyReport.fold(
        (report) {
          if (report.bills.isEmpty) {
            emit(ByMonthEmptyState());
          } else {
            emit(ByMonthLoadedState(monthlyReport: report));
          }
        },
        (failure) {
          emit(ByMonthErrorState());
        },
      );
    } on Exception catch (_) {
      emit(ByMonthErrorState());
    }
  }
}
