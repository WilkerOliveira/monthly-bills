import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_home/core/translation/home_strings.dart';

abstract class HomeDI {
  static void setup(MonthlyDI di) {
    _registerCore(di);
    _registerUsecase(di);
    _registerRepository(di);
    _registerDatasource(di);
    _registerCubit(di);
    _registerService(di);
  }

  static void _registerDatasource(MonthlyDI di) {}

  static void _registerRepository(MonthlyDI di) {}

  static void _registerUsecase(MonthlyDI di) {}

  static void _registerCubit(MonthlyDI di) {}

  static void _registerService(MonthlyDI di) {}

  static void _registerCore(MonthlyDI di) {
    di.registerLazySingleton<HomeStrings>(HomeStrings.new);
  }
}
