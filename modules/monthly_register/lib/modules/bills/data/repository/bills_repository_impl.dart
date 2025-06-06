import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_register/modules/bills/domain/repository/bills_repository.dart';

class BillsRepositoryImpl implements BillsRepository {
  BillsRepositoryImpl({required this.database});

  final RegisterDatabase database;

  @override
  Future<List<BillEntity>> getByRangeDate(DateTime begin, DateTime end) async {
    final register = await database.getByRangeDate(begin, end);

    return register.map((item) => BillModel.toModel(item).toEntity()).toList();
  }
}
