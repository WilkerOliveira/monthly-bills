import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_report/core/translation/report_strings.dart';
import 'package:monthly_report/modules/by_month/data/repository/by_month_repository_impl.dart';
import 'package:monthly_report/modules/by_month/domain/repository/by_month_repository.dart';
import 'package:monthly_report/modules/by_month/domain/usecases/get_report_by_month_usecase.dart';
import 'package:monthly_report/modules/by_month/presentation/cubit/by_month_cubit.dart';
import 'package:monthly_report/modules/by_year/data/repository/by_year_repository_impl.dart';
import 'package:monthly_report/modules/by_year/domain/repository/by_year_repository.dart';
import 'package:monthly_report/modules/by_year/domain/usecases/get_report_by_year_usecase.dart';
import 'package:monthly_report/modules/by_year/presentation/cubit/by_year_cubit.dart';

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

  static void _registerRepository(MonthlyDI di) {
    di
      ..registerLazySingleton<ByMonthRepository>(
        () => ByMonthRepositoryImpl(registerDatabase: di()),
      )
      ..registerLazySingleton<ByYearRepository>(
        () => ByYearRepositoryImpl(registerDatabase: di()),
      );
  }

  static void _registerUsecase(MonthlyDI di) {
    di
      ..registerFactory<GetReportByMonthUseCase>(
        () => GetReportByMonthUseCaseImpl(byMonthRepository: di()),
      )
      ..registerFactory<GetReportByYearUseCase>(
        () => GetReportByYearUseCaseImpl(byYearRepository: di()),
      );
  }

  static void _registerCubit(MonthlyDI di) {
    di
      ..registerFactory<ByMonthCubit>(() => ByMonthCubit(byMonthUsecase: di()))
      ..registerFactory<ByYearCubit>(() => ByYearCubit(byYearUseCase: di()));
  }

  static void _registerService(MonthlyDI di) {}

  static void _registerCore(MonthlyDI di) {
    di.registerLazySingleton<ReportStrings>(ReportStrings.new);
  }
}
