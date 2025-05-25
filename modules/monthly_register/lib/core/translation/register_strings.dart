import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_register/core/translation/register_translate_loader.dart';

class RegisterStrings {
  String _tr(String key) {
    return tr('${RegisterTranslateLoader.package}.$key');
  }

  String get listBillsTitle => _tr('list_bills_title');
  String get errorMessage => _tr('error_message');
  String get loading => _tr('loading');
  String get noBillsMessage => _tr('no_bills_message');
  String get startDate => _tr('start_date');
  String get endDate => _tr('end_date');
  String get filter => _tr('filter');
  String get locale => _tr('locale');
  String get invalidFilterMessage => _tr('invalid_filter_message');
}
