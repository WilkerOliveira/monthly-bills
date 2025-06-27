import 'package:isar/isar.dart';
import 'package:monthly_database/models/bill/bill_db_model.dart';

abstract class RegisterDatabase {
  Future<int> saveBill(BillDbModel bill);
  Future<List<int>> saveAll(List<BillDbModel> bills);
  Future<BillDbModel?> getById(int id);
  Future<List<BillDbModel>> getByMonth(int month, int year);
  Future<List<BillDbModel>> getByRangeDate(DateTime begin, DateTime end);
  Future<List<String>> getAllDescriptions();
  Future<void> delete(int id, {bool deleteRecurring = false});
}

class RegisterDatabaseImpl implements RegisterDatabase {
  RegisterDatabaseImpl({required Isar isar}) : _isar = isar;

  final Isar _isar;

  @override
  Future<BillDbModel?> getById(int id) async {
    return _isar.billDbModels.get(id);
  }

  @override
  Future<int> saveBill(BillDbModel bill) async {
    return _isar.writeTxn(() async {
      return _isar.billDbModels.put(bill);
    });
  }

  @override
  Future<List<BillDbModel>> getByMonth(int month, int year) async {
    return _isar.billDbModels
        .where()
        .monthYearDueDateEqualTo(year * 100 + month, DateTime(year, month))
        .findAll();
  }

  @override
  Future<List<BillDbModel>> getByRangeDate(DateTime begin, DateTime end) async {
    return _isar.billDbModels
        .where()
        .filter()
        .dueDateBetween(begin, end)
        .findAll();
  }

  @override
  Future<List<String>> getAllDescriptions() async {
    return (await _isar.billDbModels.where().findAll())
        .map((item) => item.name)
        .toList();
  }

  @override
  Future<List<int>> saveAll(List<BillDbModel> bills) async {
    return _isar.writeTxn(() async {
      return _isar.billDbModels.putAll(bills);
    });
  }

  @override
  Future<void> delete(int id, {bool deleteRecurring = false}) {
    return _isar.writeTxn(() async {
      if (deleteRecurring) {
        final recurrences =
            await _isar.billDbModels.filter().recurrenceIdEqualTo(id).findAll();

        if (recurrences.isNotEmpty) {
          await _isar.billDbModels.deleteAll(
            recurrences.map((e) => e.id!).toList(),
          );
        }
      }
      final bill = await _isar.billDbModels.get(id);
      if (bill != null) {
        await _isar.billDbModels.delete(id);
      }
    });
  }
}
