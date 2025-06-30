import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/core/translation/report_translate_loader.dart';

class ReportStrings {
  String _tr(String key) {
    return tr('${ReportTranslateLoader.package}.$key');
  }

  String get locale => _tr('locale');
  String get reportTitle => _tr('report_title');
}
