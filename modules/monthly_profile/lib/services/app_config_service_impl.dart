import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_profile/modules/profile/domain/repository/profile_repository.dart';

class AppConfigServiceImpl implements AppConfigServiceContract {
  AppConfigServiceImpl(this._repository);

  final ProfileRepository _repository;

  @override
  Future<AppConfigEntity> getAppConfig() async {
    return _repository.getOrCreateAppConfig();
  }
}
