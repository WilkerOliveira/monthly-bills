import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_login/core/translation/login_strings.dart';
import 'package:monthly_login/modules/login/data/datasources/firebase_datasource.dart';
import 'package:monthly_login/modules/login/data/repositories/login_repository_impl.dart';
import 'package:monthly_login/modules/login/domain/repositories/login_repository.dart';
import 'package:monthly_login/modules/login/domain/usecases/login_usecase.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_cubit.dart';
import 'package:monthly_login/services/auth_service.dart';

abstract class LoginDI {
  static void setup(MonthlyDI di) {
    _registerCore(di);
    _registerUsecase(di);
    _registerRepository(di);
    _registerDatasource(di);
    _registerCubit(di);
    _registerService(di);
  }

  static void _registerDatasource(MonthlyDI di) {
    di.registerLazySingleton<FirebaseDatasource>(
      () => FirebaseDatasourceImpl(firebaseAuth: di(), googleSignIn: di()),
    );
  }

  static void _registerRepository(MonthlyDI di) {
    di.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginDatasource: di()),
    );
  }

  static void _registerUsecase(MonthlyDI di) {
    di.registerLazySingleton<LoginUsecase>(() => LoginUsecaseImpl(di()));
  }

  static void _registerCubit(MonthlyDI di) {
    di.registerFactory<LoginCubit>(() => LoginCubit(loginUsecase: di()));
  }

  static void _registerService(MonthlyDI di) {
    di.registerLazySingleton<AuthServiceContract>(
      () => AuthServiceImpl(firebaseAuth: di()),
    );
  }

  static void _registerCore(MonthlyDI di) {
    di.registerLazySingleton<LoginStrings>(LoginStrings.new);
  }
}
