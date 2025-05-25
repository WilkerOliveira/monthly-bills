import 'package:monthly_domain/monthly_domain.dart';

abstract class BillsRepository {
  Future<void> save(BillEntity bill);
  Future<BillEntity> getById(int id);
  Future<List<BillEntity>> getByRangeDate(DateTime begin, DateTime end);
}
