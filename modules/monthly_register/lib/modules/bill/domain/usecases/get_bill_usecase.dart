import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_register/modules/bill/domain/repository/bill_repository.dart';

abstract class GetBillUsecase {
  Future<Result<BillEntity>> call(String id);
}

class GetBillUsecaseImpl implements GetBillUsecase {
  GetBillUsecaseImpl({required this.repository});

  final BillRepository repository;

  @override
  Future<Result<BillEntity>> call(String id) async {
    try {
      return Success(await repository.getById(int.parse(id)));
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
