import 'package:monthly_core/translation/core_translate_loader.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

class CoreStrings {
  String _tr(String key) {
    return tr('${CoreTranslateLoader.package}.$key');
  }

  String get menuHome => _tr('menu_home');
  String get menuBills => _tr('menu_bills');
  String get menuReports => _tr('menu_reports');
  String get menuProfile => _tr('menu_profile');
}
