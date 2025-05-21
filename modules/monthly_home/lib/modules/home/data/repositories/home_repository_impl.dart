import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_home/modules/home/data/models/bill_model.dart';
import 'package:monthly_home/modules/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.registerDatabase});

  final RegisterDatabase registerDatabase;

  @override
  Future<List<BillEntity>> getBills(DateTime begin, DateTime end) async {
    final bills = await registerDatabase.getByRangeDate(begin, end);

    return bills.map((e) => BillModel.toModel(e).toEntity()).toList();
  }
}
