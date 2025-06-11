import 'package:isar/isar.dart';
import 'package:monthly_database/models/app_config/app_config_db_model.dart';

abstract class AppConfigDatabase {
  Future<int> saveConfig(AppConfigDbModel config);
  Future<AppConfigDbModel?> getConfig();
}

class AppConfigDatabaseImpl implements AppConfigDatabase {
  AppConfigDatabaseImpl({required Isar isar}) : _isar = isar;

  final Isar _isar;

  @override
  Future<AppConfigDbModel?> getConfig() {
    return _isar.appConfigDbModels.where().findFirst();
  }

  @override
  Future<int> saveConfig(AppConfigDbModel config) async {
    return _isar.writeTxn(() async {
      return _isar.appConfigDbModels.put(config);
    });
  }
}
