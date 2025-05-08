import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/modules/home/domain/entities/summary_bills_entity.dart';
import 'package:monthly_home/modules/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState());

  Future<void> init() async {
    emit(HomeLoadingState());

    emit(
      HomeSuccessState(
        bill: SummaryBillsEntity.empty(),
        isEmpty: false,
        isError: true,
      ),
    );
  }
}
