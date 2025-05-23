import 'package:monthly_core/localization_help/easy_localization_multi.dart';
import 'package:monthly_core/translation/core_translate_loader.dart';
import 'package:monthly_home/monthly_home.dart';
import 'package:monthly_login/monthly_login.dart';

MultiAssetLoader get multiAssetLoader {
  return MultiAssetLoader([
    LoginTranslateLoader(),
    HomeTranslateLoader(),
    CoreTranslateLoader(),
  ]);
}
