import 'package:monthly_common/assets_loader/base_loader.dart';

class CoreTranslateLoader extends BaseLoader {
  CoreTranslateLoader() : super(package);

  static const String package = 'monthly_core';

  @override
  String getAssetPath(String localePath) =>
      'packages/monthly_core/assets/translations/$localePath.json';
}
