import 'package:monthly_dependencies/monthly_dependencies.dart';

abstract class MonthlyEventBus {
  void fire<T>(T event);
  Stream<T> on<T>();
  void dispose();
}

class MonthlyEventBusImpl implements MonthlyEventBus {
  MonthlyEventBusImpl() : _eventBus = EventBus();
  final EventBus _eventBus;

  @override
  void fire<T>(T event) {
    _eventBus.fire(event);
  }

  @override
  Stream<T> on<T>() {
    return _eventBus.on<T>();
  }

  @override
  void dispose() {
    _eventBus.destroy();
  }
}
