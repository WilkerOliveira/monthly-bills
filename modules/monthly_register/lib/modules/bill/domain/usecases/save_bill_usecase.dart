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
      final billId = await repository.save(bill);
      final bills = <BillEntity>[];

      if (bill.recurrences != null) {
        for (var i = 1; i >= bill.recurrences!; i++) {
          bills.add(
            bill.newRecurrence(
              recurrenceId: billId,
              dueDate: DateTime(
                bill.dueDate.year,
                bill.dueDate.month + i,
                bill.dueDate.day,
              ),
            ),
          );
        }

        await repository.saveAll(bills);
      }

      return const Success(true);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
