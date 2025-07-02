import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/core/translation/report_translate_loader.dart';

class ReportStrings {
  String _tr(String key) {
    return tr('${ReportTranslateLoader.package}.$key');
  }

  String get locale => _tr('locale');
  String get reportTitle => _tr('report_title');
  String get reportByCategory => _tr('report_by_category');
  String get reportByMonth => _tr('report_by_month');
  String get reportByYear => _tr('report_by_year');
  String get consolidatedReport => _tr('consolidated_report');
  String get reportByDescription => _tr('report_by_description');
  String get reportByMonthTitle => _tr('report_by_month_title');
}
