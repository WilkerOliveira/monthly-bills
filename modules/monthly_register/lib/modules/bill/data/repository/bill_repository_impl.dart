import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/entities/bill_entity.dart';
import 'package:monthly_register/modules/bill/domain/repository/bill_repository.dart';
import 'package:monthly_register/modules/core/exceptions/bills_exceptions.dart';
import 'package:monthly_register/modules/core/models/bill_model.dart';

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
  Future<void> save(BillEntity bill) async {
    await database.saveBill(BillModel.entityToModel(bill).toDbModel());
  }
}
