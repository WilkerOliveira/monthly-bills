import 'package:monthly_common/assets_loader/base_loader.dart';

class UITranslateLoader extends BaseLoader {
  UITranslateLoader() : super(package);

  static const String package = 'monthly_ui_components';

  @override
  String getAssetPath(String localePath) =>
      'packages/monthly_ui_components/assets/translations/$localePath.json';
}
