import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_register/modules/bill/domain/usecases/get_bill_usecase.dart';
import 'package:monthly_register/modules/bill/domain/usecases/save_bill_usecase.dart';
import 'package:monthly_register/modules/bill/presentation/cubit/bill_state.dart';

class BillCubit extends Cubit<BillState> {
  BillCubit(this._getBillUsecase, this._saveBillUsecase)
    : super(const BillInitial());

  final GetBillUsecase _getBillUsecase;
  final SaveBillUsecase _saveBillUsecase;

  Future<void> getBill(String id) async {
    emit(const BillLoading());
    try {
      final result = await _getBillUsecase(id);

      result.fold(
        (bill) => emit(BillLoaded(bill: bill)),
        (failure) => emit(const BillError()),
      );
    } on Exception catch (_) {
      emit(const BillError());
    }
  }

  Future<void> saveBill(BillEntity bill) async {
    emit(const BillLoading());
    try {
      final result = await _saveBillUsecase(bill);
      result.fold(
        (success) => emit(const BillSavedState()),
        (failure) => emit(const BillError()),
      );
    } on Exception catch (_) {
      emit(const BillError());
    }
  }

  Future<void> removeBill(BillEntity bill) async {}
}
