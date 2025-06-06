import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_register/modules/bill/domain/repository/bill_repository.dart';

abstract class GetUniqueDescriptionsUsecase {
  Future<Result<List<String>>> call();
}

class GetUniqueDescriptionsUsecaseImpl implements GetUniqueDescriptionsUsecase {
  GetUniqueDescriptionsUsecaseImpl({required this.repository});

  final BillRepository repository;

  @override
  Future<Result<List<String>>> call() async {
    try {
      return Success(await repository.getUniqueDescriptions());
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
