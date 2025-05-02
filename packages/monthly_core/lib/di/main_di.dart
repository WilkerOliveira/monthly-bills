import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/monthly_home.dart';
import 'package:monthly_login/monthly_login.dart';

class MainDI {
  static void setup() {
    _registerExternal(MonthlyDI.I);
    LoginDI.setup(MonthlyDI.I);
    HomeDI.setup(MonthlyDI.I);
  }

  static void _registerExternal(MonthlyDI di) {
    di
      ..registerLazySingleton(() => FirebaseAuth.instance)
      ..registerLazySingleton(GoogleSignIn.new);
  }
}
