import 'package:monthly_common/monthly_common.dart';
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
      final recurrences = <BillEntity>[];

      if (bill.recurrences != null && bill.recurrences! > 0) {
        DateTime? nextDueDate;
        for (var i = 1; i <= bill.recurrences!; i++) {
          nextDueDate =
              nextDueDate?.getNextMonth(bill.dueDate.day) ??
              bill.dueDate.getNextMonth(bill.dueDate.day);

          recurrences.add(
            BillEntity(
              name: bill.name,
              category: bill.category,
              amount: bill.amount,
              extraInfo: bill.extraInfo,
              paid: false,
              dueDate: nextDueDate,
            ),
          );
        }

        await repository.saveAll(bill, recurrences);
      } else {
        await repository.save(bill);
      }

      return const Success(true);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
