import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_profile/core/translation/profile_translate_loader.dart';

class ProfileStrings {
  String _tr(String key) {
    return tr('${ProfileTranslateLoader.package}.$key');
  }

  String get locale => _tr('locale');
  String get profileTitle => _tr('profile_title');
  String get configDateDescription => _tr('config_date_description');
  String get startDay => _tr('start_day');
  String get endDay => _tr('end_day');
  String get requiredField => _tr('required_field');
  String get invalidDate => _tr('invalid_date');
  String get save => _tr('save');
  String get savedSuccessfully => _tr('saved_successfully');
  String get errorSaveMessage => _tr('error_save_message');
}
