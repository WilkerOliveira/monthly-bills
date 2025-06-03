import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_register/modules/bills/domain/repository/bills_repository.dart';
import 'package:monthly_register/modules/core/exceptions/bills_exceptions.dart';

abstract class GetBillsByRangeUsecase {
  Future<Result<List<BillEntity>>> call({
    required DateTime begin,
    required DateTime end,
  });
}

class GetBillsByRangeUsecaseImpl implements GetBillsByRangeUsecase {
  GetBillsByRangeUsecaseImpl({required this.repository});

  final BillsRepository repository;

  @override
  Future<Result<List<BillEntity>>> call({
    required DateTime begin,
    required DateTime end,
  }) async {
    try {
      final result = await repository.getByRangeDate(begin, end);
      return Success(result);
    } on BillException catch (e) {
      return Failure(e);
    }
  }
}
