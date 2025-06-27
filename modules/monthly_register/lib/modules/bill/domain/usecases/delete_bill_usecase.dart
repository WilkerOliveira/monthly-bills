import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_register/modules/bill/domain/repository/bill_repository.dart';
import 'package:monthly_register/modules/core/exceptions/bills_exceptions.dart';

abstract class DeleteBillUsecase {
  Future<Result<bool>> call(BillEntity bill, {bool deleteRecurring = false});
}

class DeleteBillUsecaseImpl implements DeleteBillUsecase {
  DeleteBillUsecaseImpl(this._billRepository);
  final BillRepository _billRepository;

  @override
  Future<Result<bool>> call(
    BillEntity bill, {
    bool deleteRecurring = false,
  }) async {
    if (bill.id == null) {
      return Failure(BillIdNotFoundException());
    }

    try {
      await _billRepository.delete(bill.id!, deleteRecurring: deleteRecurring);
      return const Success(true);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
