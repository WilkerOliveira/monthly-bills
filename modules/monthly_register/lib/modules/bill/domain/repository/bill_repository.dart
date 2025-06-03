import 'package:monthly_domain/monthly_domain.dart';

abstract class BillRepository {
  Future<void> save(BillEntity bill);
  Future<BillEntity> getById(int id);
}
