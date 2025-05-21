import 'package:isar/isar.dart';
import 'package:monthly_database/models/bill_db_model.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatabase {
  static Isar? _instance;

  static Future<Isar> get instance async {
    _instance ??= await Isar.open([
      BillDbModelSchema,
    ], directory: (await getApplicationSupportDirectory()).path);
    return _instance!;
  }

  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
  }
}
