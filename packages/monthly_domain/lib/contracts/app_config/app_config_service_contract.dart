import 'package:monthly_domain/monthly_domain.dart';

abstract class AppConfigServiceContract {
  Future<AppConfigEntity> getAppConfig();
}
