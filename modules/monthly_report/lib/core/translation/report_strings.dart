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
  String get totalBills => _tr('total_bills');
  String get paidBills => _tr('paid_bills');
  String get pendingBills => _tr('pending_bills');
  String get billsOverdue => _tr('bills_overdue');
  String get noBillsFound => _tr('no_bills_found');
  String get dueDate => _tr('due_date');
}
