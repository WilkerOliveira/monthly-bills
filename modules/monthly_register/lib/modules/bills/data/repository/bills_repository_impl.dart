import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/entities/bill_entity.dart';
import 'package:monthly_register/modules/bills/core/exceptions/bills_exceptions.dart';
import 'package:monthly_register/modules/bills/data/models/bill_model.dart';
import 'package:monthly_register/modules/bills/domain/repository/bills_repository.dart';

class BillsRepositoryImpl implements BillsRepository {
  BillsRepositoryImpl({required this.database});

  final RegisterDatabase database;

  @override
  Future<BillEntity> getById(int id) async {
    final register = await database.getById(id);
    if (register == null) throw BillNotFoundException();
    return BillModel.toModel(register).toEntity();
  }

  @override
  Future<void> save(BillEntity bill) {
    return database.saveBill(BillModel.entityToModel(bill).toDbModel());
  }
}
