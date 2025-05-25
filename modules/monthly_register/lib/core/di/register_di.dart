import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_register/core/translation/register_strings.dart';
import 'package:monthly_register/modules/bills/data/repository/bills_repository_impl.dart';
import 'package:monthly_register/modules/bills/domain/repository/bills_repository.dart';
import 'package:monthly_register/modules/bills/domain/usecases/get_bills_by_range_usecase.dart';
import 'package:monthly_register/modules/bills/presentation/cubit/filter_widget_cubit.dart';

abstract class RegisterDi {
  static void setup(MonthlyDI di) {
    _registerCore(di);
    _registerUsecase(di);
    _registerRepository(di);
    _registerDatabase(di);
    _registerCubit(di);
    _registerService(di);
  }

  static void _registerDatabase(MonthlyDI di) {}

  static void _registerRepository(MonthlyDI di) {
    di.registerLazySingleton<BillsRepository>(
      () => BillsRepositoryImpl(database: di()),
    );
  }

  static void _registerUsecase(MonthlyDI di) {
    di.registerFactory<GetBillsByRangeUsecase>(
      () => GetBillsByRangeUsecaseImpl(repository: di()),
    );
  }

  static void _registerCubit(MonthlyDI di) {
    di.registerFactory<FilterWidgetCubit>(FilterWidgetCubit.new);
  }

  static void _registerService(MonthlyDI di) {}

  static void _registerCore(MonthlyDI di) {
    di.registerLazySingleton<RegisterStrings>(RegisterStrings.new);
  }
}
