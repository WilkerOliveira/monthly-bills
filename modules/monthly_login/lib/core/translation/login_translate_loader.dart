import 'package:monthly_common/assets_loader/base_loader.dart';

class LoginTranslateLoader extends BaseLoader {
  LoginTranslateLoader() : super(package);

  static const String package = 'monthly_login';

  @override
  String getAssetPath(String localePath) =>
      'packages/monthly_login/assets/translations/$localePath.json';
}
