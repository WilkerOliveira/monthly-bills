import 'package:flutter/foundation.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

class MonthlyDI {
  MonthlyDI._internal();
  static MonthlyDI _instance = MonthlyDI._internal();
  static MonthlyDI get I => _instance;

  void registerLazySingleton<T extends Object>(
    T Function() factory, [
    void Function(T)? disposeFunction,
  ]) {
    GetIt.I.registerLazySingleton<T>(
      factory,
      dispose: (param) {
        if (disposeFunction != null) {
          disposeFunction(param);
        }
      },
    );
  }

  void registerFactory<T extends Object>(T Function() factory) {
    GetIt.I.registerFactory<T>(factory);
  }

  void registerSingleton<T extends Object>(T instance) {
    GetIt.I.registerSingleton<T>(instance);
  }

  T get<T extends Object>() {
    return GetIt.I.get<T>();
  }

  T call<T extends Object>() {
    return GetIt.I<T>();
  }

  void reset() {
    GetIt.I.reset();
  }

  void unregister<T extends Object>() {
    GetIt.I.unregister<T>();
  }

  @visibleForTesting
  static void enableTestMode({bool reset = true}) {
    if (reset) {
      GetIt.I.reset();
    }
    _instance = MonthlyDI._internal();
  }
}
