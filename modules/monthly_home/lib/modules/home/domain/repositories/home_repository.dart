import 'package:monthly_domain/monthly_domain.dart';

abstract class HomeRepository {
  Future<List<BillEntity>> getBills(DateTime begin, DateTime end);
}
