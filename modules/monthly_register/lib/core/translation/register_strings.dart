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
  String get billTitle => _tr('bill_title');
  String get description => _tr('description');
  String get amount => _tr('amount');
  String get dueDate => _tr('due_Date');
  String get extraInfo => _tr('extra_info');
  String get paymentDate => _tr('payment_date');
  String get requiredField => _tr('required_field');
  String get invalidDate => _tr('invalid_date');
  String get billSavedSuccessfully => _tr('bill_saved_successfully');
  String get errorSavingBill => _tr('error_saving_bill');
  String get isPaid => _tr('id_paid');
  String get recurringMonths => _tr('recurring_months');
}
