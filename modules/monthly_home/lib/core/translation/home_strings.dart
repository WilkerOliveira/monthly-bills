import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/core/translation/home_translate_loader.dart';

class HomeStrings {
  String _tr(String key) {
    return tr('${HomeTranslateLoader.package}.$key');
  }

  String get homeTitle => _tr('home_title');
  String get homeWelcome => _tr('home_welcome');
  String get homeTotalDue => _tr('home_total_due');
  String get homeUpcoming => _tr('home_upcoming');
  String get homeSubtitle => _tr('home_subtitle');
  String get homeSeeAll => _tr('home_see_all');
  String get homeNoBillsMessage => _tr('home_no_bills_message');
  String get homeErrorMessage => _tr('home_error_message');
  String get homeAddFirstBill => _tr('home_add_first_bill');
  String get homeDueUntil => _tr('home_due_until');
  String get homePay => _tr('home_pay');
  String get homeLoading => _tr('home_loading');
}
