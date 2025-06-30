import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_report/core/translation/report_strings.dart';

abstract class ReportDI {
  static void setup(MonthlyDI di) {
    _registerCore(di);
    _registerDatabase(di);
    _registerRepository(di);
    _registerUsecase(di);
    _registerCubit(di);
    _registerService(di);
  }

  static void _registerDatabase(MonthlyDI di) {}

  static void _registerRepository(MonthlyDI di) {}

  static void _registerUsecase(MonthlyDI di) {}

  static void _registerCubit(MonthlyDI di) {}

  static void _registerService(MonthlyDI di) {}

  static void _registerCore(MonthlyDI di) {
    di.registerLazySingleton<ReportStrings>(ReportStrings.new);
  }
}
