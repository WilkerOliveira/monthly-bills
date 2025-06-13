import 'package:monthly_dependencies/monthly_dependencies.dart';

class AppConfigEntity extends Equatable {
  const AppConfigEntity({
    required this.startDay,
    required this.endDay,
    this.id,
  });

  factory AppConfigEntity.empty() {
    return const AppConfigEntity(id: 0, startDay: 0, endDay: 0);
  }
  final int? id;
  final int startDay;
  final int endDay;

  @override
  List<Object?> get props => [startDay, endDay, id];

  AppConfigEntity copyWith({int? id, int? startDay, int? endDay}) {
    return AppConfigEntity(
      id: id ?? this.id,
      startDay: startDay ?? this.startDay,
      endDay: endDay ?? this.endDay,
    );
  }

  DateTime get startDate {
    final now = DateTime.now();
    return DateTime(now.year, now.month, startDay);
  }

  DateTime get endDate {
    final now = DateTime.now();
    return DateTime(now.year, now.month, endDay);
  }
}
