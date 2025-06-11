import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_profile/core/translation/profile_strings.dart';
import 'package:monthly_profile/modules/profile/data/repository/profile_repository_impl.dart';
import 'package:monthly_profile/modules/profile/domain/repository/profile_repository.dart';
import 'package:monthly_profile/modules/profile/domain/usecases/get_config_usecase.dart';
import 'package:monthly_profile/modules/profile/domain/usecases/save_config_usecase.dart';
import 'package:monthly_profile/modules/profile/presentation/cubit/profile_cubit.dart';

abstract class ProfileDI {
  static void setup(MonthlyDI di) {
    _registerCore(di);
    _registerDatabase(di);
    _registerRepository(di);
    _registerUsecase(di);
    _registerCubit(di);
    _registerService(di);
  }

  static void _registerDatabase(MonthlyDI di) {}

  static void _registerRepository(MonthlyDI di) {
    di.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(database: di()),
    );
  }

  static void _registerUsecase(MonthlyDI di) {
    di
      ..registerFactory<GetConfigUsecase>(
        () => GetConfigUsecaseImpl(repository: di()),
      )
      ..registerFactory<SaveConfigUsecase>(
        () => SaveConfigUsecaseImpl(repository: di()),
      );
  }

  static void _registerCubit(MonthlyDI di) {
    di.registerFactory<ProfileCubit>(
      () => ProfileCubit(di(), di()),
    );
  }

  static void _registerService(MonthlyDI di) {}

  static void _registerCore(MonthlyDI di) {
    di.registerLazySingleton<ProfileStrings>(ProfileStrings.new);
  }
}
