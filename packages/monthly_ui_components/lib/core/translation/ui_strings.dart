import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_ui_components/core/translation/ui_translate_loader.dart';

class UIStrings {
  UIStrings._();
  static final UIStrings _instance = UIStrings._();
  static UIStrings get I => _instance;

  String _tr(String key) {
    return tr('${UITranslateLoader.package}.$key');
  }

  String get startDate => _tr('start_date');
  String get endDate => _tr('end_date');
  String get filter => _tr('filter');
  String get locale => _tr('locale');
  String get requiredField => _tr('required_field');
  String get invalidDateFilterMessage => _tr('invalid_date_filter_message');
  String get endDateBeforeStartDate => _tr('end_date_before_start_date');
}
