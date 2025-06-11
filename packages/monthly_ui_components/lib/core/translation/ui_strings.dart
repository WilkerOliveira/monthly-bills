import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_ui_components/core/translation/ui_translate_loader.dart';

class UIStrings {
  const UIStrings._();
  static const UIStrings _instance = UIStrings._();
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
  String get selectBillType => _tr('select_bill_type');
  String get billType => _tr('bill_type');
  String get electricity => _tr('electricity');
  String get water => _tr('water');
  String get rent => _tr('rent');
  String get financing => _tr('financing');
  String get personalLoan => _tr('personal_loan');
  String get groceries => _tr('groceries');
  String get diningOut => _tr('diningOut');
  String get transportation => _tr('transportation');
  String get fuel => _tr('fuel');
  String get phoneBill => _tr('phoneBill');
  String get internet => _tr('internet');
  String get streaming => _tr('streaming');
  String get gym => _tr('gym');
  String get healthInsurance => _tr('healthInsurance');
  String get medications => _tr('medications');
  String get education => _tr('education');
  String get clothing => _tr('clothing');
  String get entertainment => _tr('entertainment');
  String get gifts => _tr('gifts');
  String get donations => _tr('donations');
  String get travel => _tr('travel');
  String get subscriptions => _tr('subscriptions');
  String get petCare => _tr('petCare');
  String get childcare => _tr('childcare');
  String get carMaintenance => _tr('carMaintenance');
  String get homeMaintenance => _tr('homeMaintenance');
  String get taxes => _tr('taxes');
  String get insurance => _tr('insurance');
  String get savings => _tr('savings');
  String get investments => _tr('investments');
  String get miscellaneous => _tr('miscellaneous');
  String get other => _tr('other');
  String get creditCard => _tr('creditCard');
  String get dueDate => _tr('due_date');
  String get dayOfMonth => _tr('day_of_month');
}
