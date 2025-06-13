import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_home/modules/home/data/repositories/home_repository_impl.dart';
import 'package:monthly_home/modules/home/domain/repositories/home_repository.dart';
import 'package:monthly_home/modules/home/domain/usecases/summary_usecase.dart';
import 'package:monthly_home/modules/home/presentation/cubit/home_cubit.dart';

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

  static void _registerRepository(MonthlyDI di) {
    di.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(registerDatabase: di.get<RegisterDatabase>()),
    );
  }

  static void _registerUsecase(MonthlyDI di) {
    di.registerLazySingleton<SummaryUsecase>(
      () => SummaryUsecaseImpl(di.get<HomeRepository>()),
    );
  }

  static void _registerCubit(MonthlyDI di) {
    di.registerFactory<HomeCubit>(
      () => HomeCubit(di.get<SummaryUsecase>(), di()),
    );
  }

  static void _registerService(MonthlyDI di) {}

  static void _registerCore(MonthlyDI di) {
    di.registerLazySingleton<HomeStrings>(HomeStrings.new);
  }
}
