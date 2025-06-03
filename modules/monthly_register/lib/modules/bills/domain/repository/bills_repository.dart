import 'package:monthly_domain/monthly_domain.dart';

abstract class BillsRepository {
  Future<List<BillEntity>> getByRangeDate(DateTime begin, DateTime end);
}
