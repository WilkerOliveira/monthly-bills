import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_database/database/base/isar_database.dart';
import 'package:monthly_database/database/registers/register_database.dart';

abstract class DatabaseDi {
  static Future<void> setup(MonthlyDI di) async {
    final isar = await IsarDatabase.instance;
    di.registerLazySingleton<RegisterDatabase>(
      () => RegisterDatabaseImpl(isar: isar),
    );
  }
}
