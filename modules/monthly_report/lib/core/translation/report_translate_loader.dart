import 'package:monthly_common/assets_loader/base_loader.dart';

class ReportTranslateLoader extends BaseLoader {
  ReportTranslateLoader() : super(package);

  static const String package = 'monthly_report';

  @override
  String getAssetPath(String localePath) =>
      'packages/monthly_report/assets/translations/$localePath.json';
}
