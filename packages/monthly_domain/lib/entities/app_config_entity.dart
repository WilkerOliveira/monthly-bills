import 'package:monthly_dependencies/monthly_dependencies.dart';

class AppConfigEntity extends Equatable {
  const AppConfigEntity({required this.startDay, required this.endDay});

  factory AppConfigEntity.empty() {
    return const AppConfigEntity(startDay: 0, endDay: 0);
  }

  final int startDay;
  final int endDay;

  @override
  List<Object?> get props => [startDay, endDay];

  AppConfigEntity copyWith({int? startDay, int? endDay}) {
    return AppConfigEntity(
      startDay: startDay ?? this.startDay,
      endDay: endDay ?? this.endDay,
    );
  }
}
