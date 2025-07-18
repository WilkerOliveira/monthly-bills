import 'package:monthly_dependencies/monthly_dependencies.dart';

class MonthYearReportEntity extends Equatable {
  const MonthYearReportEntity({required this.month, required this.total});

  final int month;
  final double total;

  @override
  List<Object?> get props => [month, total];
}
