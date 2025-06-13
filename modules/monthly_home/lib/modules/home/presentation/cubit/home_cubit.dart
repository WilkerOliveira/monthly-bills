import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_home/modules/home/domain/usecases/summary_usecase.dart';
import 'package:monthly_home/modules/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._summaryUsecase, this._appConfigService)
    : super(HomeLoadingState());

  final SummaryUsecase _summaryUsecase;
  final AppConfigServiceContract _appConfigService;

  Future<void> loadData(AppConfigEntity? appConfigEntity) async {
    emit(HomeLoadingState());

    try {
      var appConfig = appConfigEntity;
      appConfig ??= await _appConfigService.getAppConfig();

      final result = await _summaryUsecase(
        appConfig.startDate,
        appConfig.endDate,
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
