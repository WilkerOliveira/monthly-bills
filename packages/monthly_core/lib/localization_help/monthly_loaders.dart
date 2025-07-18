import 'package:monthly_core/localization_help/easy_localization_multi.dart';
import 'package:monthly_core/translation/core_translate_loader.dart';
import 'package:monthly_home/monthly_home.dart';
import 'package:monthly_login/monthly_login.dart';
import 'package:monthly_profile/monthly_profile.dart';
import 'package:monthly_register/monthly_register.dart';
import 'package:monthly_report/monthly_report.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

MultiAssetLoader get multiAssetLoader {
  return MultiAssetLoader([
    LoginTranslateLoader(),
    HomeTranslateLoader(),
    CoreTranslateLoader(),
    RegisterTranslateLoader(),
    UITranslateLoader(),
    ProfileTranslateLoader(),
    ReportTranslateLoader(),
  ]);
}
