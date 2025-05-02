import 'package:monthly_common/assets_loader/base_loader.dart';

class HomeTranslateLoader extends BaseLoader {
  HomeTranslateLoader() : super(package);

  static const String package = 'monthly_home';

  @override
  String getAssetPath(String localePath) =>
      'packages/monthly_home/assets/translations/$localePath.json';
}
