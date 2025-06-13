import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/modules/home/domain/entities/summary_bills_entity.dart';
import 'package:monthly_home/modules/home/domain/repositories/home_repository.dart';
import 'package:monthly_home/modules/home/exceptions/home_exceptions.dart';

abstract class SummaryUsecase {
  Future<Result<SummaryBillsEntity>> call(DateTime begin, DateTime end);
}

class SummaryUsecaseImpl implements SummaryUsecase {
  const SummaryUsecaseImpl(this._respository);

  final HomeRepository _respository;

  @override
  Future<Result<SummaryBillsEntity>> call(DateTime begin, DateTime end) async {
    try {
      final bills = await _respository.getBills(begin, end);
      final totalAmount = bills.fold<double>(
        0,
        (previousValue, element) => previousValue + element.amount,
      );
      final upcomingBills = bills.where((bill) => !bill.paid).length;
      return Success(
        SummaryBillsEntity(
          totalAmount: totalAmount,
          upcomingBills: upcomingBills,
          bills: bills,
          startDate: begin,
          endDate: end,
        ),
      );
    } on Exception catch (_) {
      return Failure(CouldNotGetBillsException());
    }
  }
}
