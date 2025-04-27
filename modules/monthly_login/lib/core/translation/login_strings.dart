import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/core/translation/login_translate_loader.dart';

class LoginStrings {
  String _tr(String key) {
    return tr('${LoginTranslateLoader.package}.$key');
  }

  String get loginAppName => _tr('login_app_name');
  String get loginAppNameDesc => _tr('login_app_name_desc');
  String get loginButtonTitle => _tr('login_button_title');
  String get somethingWentWrong => _tr('something_went_wrong');
  String get loginSuccessMessage => _tr('login_success_message');
}
