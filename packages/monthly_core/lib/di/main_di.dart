import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_core/translation/core_strings.dart';
import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/monthly_home.dart';
import 'package:monthly_login/monthly_login.dart';
import 'package:monthly_register/monthly_register.dart';

class MainDI {
  static void setup() {
    _registerExternal(MonthlyDI.I);
    DatabaseDi.setup(MonthlyDI.I);
    LoginDI.setup(MonthlyDI.I);
    RegisterDi.setup(MonthlyDI.I);
    HomeDI.setup(MonthlyDI.I);
  }

  static void _registerExternal(MonthlyDI di) {
    di
      ..registerLazySingleton(() => FirebaseAuth.instance)
      ..registerLazySingleton(GoogleSignIn.new)
      ..registerLazySingleton<CoreStrings>(CoreStrings.new);
  }
}
