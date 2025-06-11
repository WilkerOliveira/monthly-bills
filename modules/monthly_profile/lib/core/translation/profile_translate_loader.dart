import 'package:monthly_common/assets_loader/base_loader.dart';

class ProfileTranslateLoader extends BaseLoader {
  ProfileTranslateLoader() : super(package);

  static const String package = 'monthly_profile';

  @override
  String getAssetPath(String localePath) =>
      'packages/monthly_profile/assets/translations/$localePath.json';
}
