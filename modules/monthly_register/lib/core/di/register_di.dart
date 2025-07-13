import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_register/core/translation/register_strings.dart';
import 'package:monthly_register/modules/bill/data/repository/bill_repository_impl.dart';
import 'package:monthly_register/modules/bill/domain/repository/bill_repository.dart';
import 'package:monthly_register/modules/bill/domain/usecases/delete_bill_usecase.dart';
import 'package:monthly_register/modules/bill/domain/usecases/get_bill_usecase.dart';
import 'package:monthly_register/modules/bill/domain/usecases/get_unique_descriptions_usecase.dart';
import 'package:monthly_register/modules/bill/domain/usecases/save_bill_usecase.dart';
import 'package:monthly_register/modules/bill/presentation/cubit/bill_cubit.dart';
import 'package:monthly_register/modules/bill/presentation/widgets/cubit/description_autocomplete_cubit.dart';
import 'package:monthly_register/modules/bills/data/repository/bills_repository_impl.dart';
import 'package:monthly_register/modules/bills/domain/repository/bills_repository.dart';
import 'package:monthly_register/modules/bills/domain/usecases/get_bills_by_range_usecase.dart';
import 'package:monthly_register/modules/bills/presentation/cubit/filter_widget_cubit.dart';
import 'package:monthly_register/modules/bills/presentation/cubit/list_bills_cubit.dart';

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
    di
      ..registerLazySingleton<BillsRepository>(
        () => BillsRepositoryImpl(database: di()),
      )
      ..registerLazySingleton<BillRepository>(
        () => BillRepositoryImpl(database: di()),
      );
  }

  static void _registerUsecase(MonthlyDI di) {
    di
      ..registerFactory<GetBillsByRangeUsecase>(
        () => GetBillsByRangeUsecaseImpl(repository: di()),
      )
      ..registerFactory<SaveBillUsecase>(
        () => SaveBillUsecaseImpl(repository: di()),
      )
      ..registerFactory<GetBillUsecase>(
        () => GetBillUsecaseImpl(repository: di()),
      )
      ..registerFactory<GetUniqueDescriptionsUsecase>(
        () => GetUniqueDescriptionsUsecaseImpl(repository: di()),
      )
      ..registerFactory<DeleteBillUsecase>(() => DeleteBillUsecaseImpl(di()));
  }

  static void _registerCubit(MonthlyDI di) {
    di
      ..registerFactory<FilterWidgetCubit>(FilterWidgetCubit.new)
      ..registerFactory<ListBillsCubit>(
        () => ListBillsCubit(getBillsByRangeUsecase: di()),
      )
      ..registerFactory<BillCubit>(() => BillCubit(di(), di(), di()))
      ..registerFactory<DescriptionAutocompleteCubit>(
        () => DescriptionAutocompleteCubit(di()),
      );
  }

  static void _registerService(MonthlyDI di) {}

  static void _registerCore(MonthlyDI di) {
    di.registerLazySingleton<RegisterStrings>(RegisterStrings.new);
  }
}
