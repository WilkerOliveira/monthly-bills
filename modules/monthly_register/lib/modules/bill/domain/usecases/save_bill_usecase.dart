import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_register/modules/bill/domain/repository/bill_repository.dart';

abstract class SaveBillUsecase {
  Future<Result<bool>> call(BillEntity bill);
}

class SaveBillUsecaseImpl implements SaveBillUsecase {
  SaveBillUsecaseImpl({required this.repository});

  final BillRepository repository;

  @override
  Future<Result<bool>> call(BillEntity bill) async {
    try {
      await repository.save(bill);
      return const Success(true);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
