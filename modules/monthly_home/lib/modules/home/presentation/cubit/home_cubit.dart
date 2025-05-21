import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/modules/home/domain/usecases/summary_usecase.dart';
import 'package:monthly_home/modules/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._summaryUsecase) : super(HomeLoadingState());

  final SummaryUsecase _summaryUsecase;

  Future<void> loadData() async {
    emit(HomeLoadingState());

    try {
      final result = await _summaryUsecase(
        DateTime.now().subtract(const Duration(days: 30)),
        DateTime.now(),
      );

      result.fold(
        (summary) => emit(
          HomeSuccessState(
            bill: summary,
            isEmpty: summary.bills.isEmpty,
            isError: false,
          ),
        ),
        (failure) => emit(HomeSuccessState(isEmpty: false, isError: true)),
      );
    } on Exception catch (_) {
      emit(HomeErrorState());
    }
  }
}
