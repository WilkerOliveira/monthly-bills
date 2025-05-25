import 'package:monthly_common/assets_loader/base_loader.dart';

class RegisterTranslateLoader extends BaseLoader {
  RegisterTranslateLoader() : super(package);

  static const String package = 'monthly_register';

  @override
  String getAssetPath(String localePath) =>
      'packages/monthly_register/assets/translations/$localePath.json';
}
