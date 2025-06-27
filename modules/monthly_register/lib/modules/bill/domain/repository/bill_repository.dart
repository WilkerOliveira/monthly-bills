import 'package:monthly_domain/monthly_domain.dart';

abstract class BillRepository {
  Future<int> save(BillEntity bill);
  Future<void> delete(int id, {bool deleteRecurring = false});
  Future<void> saveAll(BillEntity bill, List<BillEntity> recurrences);
  Future<BillEntity> getById(int id);
  Future<List<String>> getUniqueDescriptions();
}
