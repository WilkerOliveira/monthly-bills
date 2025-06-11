import 'package:monthly_domain/monthly_domain.dart';

abstract class ProfileRepository {
  Future<int> save(AppConfigEntity appConfig);
  Future<AppConfigEntity> getOrCreateAppConfig();
}
