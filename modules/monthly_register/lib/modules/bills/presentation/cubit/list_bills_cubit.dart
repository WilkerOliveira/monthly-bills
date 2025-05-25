import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_register/modules/bills/domain/usecases/get_bills_by_range_usecase.dart';
import 'package:monthly_register/modules/bills/presentation/cubit/list_bills_state.dart';

class ListBillsCubit extends Cubit<ListBillsState> {
  ListBillsCubit({required this.getBillsByRangeUsecase})
    : super(const ListBillsInitialState());

  final GetBillsByRangeUsecase getBillsByRangeUsecase;

  Future<void> fetchBills(DateTime begin, DateTime end) async {
    emit(const ListBillsLoadingState());

    final result = await getBillsByRangeUsecase(begin: begin, end: end);

    result.fold(
      (onSuccess) {
        if (onSuccess.isEmpty) {
          emit(const ListBillsEmpty());
        } else {
          emit(ListBillsLoadedState(bills: onSuccess));
        }
      },
      (onFailure) {
        emit(const ListBillsErrorState());
      },
    );
  }
}
