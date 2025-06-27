import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_register/modules/bill/domain/repository/bill_repository.dart';
import 'package:monthly_register/modules/core/exceptions/bills_exceptions.dart';

class BillRepositoryImpl implements BillRepository {
  BillRepositoryImpl({required this.database});

  final RegisterDatabase database;

  @override
  Future<BillEntity> getById(int id) async {
    final register = await database.getById(id);
    if (register == null) throw BillNotFoundException();
    return BillModel.toModel(register).toEntity();
  }

  @override
  Future<int> save(BillEntity bill) async {
    return database.saveBill(BillModel.entityToModel(bill).toDbModel());
  }

  @override
  Future<List<String>> getUniqueDescriptions() async {
    return (await database.getAllDescriptions()).toSet().toList();
  }

  @override
  Future<void> saveAll(
    BillEntity currentBill,
    List<BillEntity> recurrences,
  ) async {
    final dbRecurrences =
        recurrences
            .map((bill) => BillModel.entityToModel(bill).toDbModel())
            .toList();

    await database.saveAll(
      BillModel.entityToModel(currentBill).toDbModel(),
      dbRecurrences,
    );
  }

  @override
  Future<void> delete(int id, {bool deleteRecurring = false}) {
    return database.delete(id, deleteRecurring: deleteRecurring);
  }
}
