import 'package:isar/isar.dart';
import 'package:monthly_database/monthly_database.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatabase {
  static Isar? _instance;

  static Future<Isar> get instance async {
    _instance ??= await Isar.open([
      BillDbModelSchema,
      AppConfigDbModelSchema,
    ], directory: (await getApplicationSupportDirectory()).path);
    return _instance!;
  }

  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
  }
}
