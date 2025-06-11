import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_profile/modules/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.database});

  final AppConfigDatabase database;

  @override
  Future<AppConfigEntity> getOrCreateAppConfig() async {
    final appConfig = await database.getConfig();
    if (appConfig == null) {
      const newConfig = AppConfigEntity(startDay: 1, endDay: 31);

      await database.saveConfig(
        AppConfigModel.entityToModel(newConfig).toDbModel(),
      );
      return newConfig;
    }
    return AppConfigModel.toModel(appConfig).toEntity();
  }

  @override
  Future<int> save(AppConfigEntity appConfig) {
    return database.saveConfig(
      AppConfigModel.entityToModel(appConfig).toDbModel(),
    );
  }
}
