import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/modules/by_month/domain/entities/monthly_report_entity.dart';

abstract class ByMonthState extends Equatable {}

class ByMonthInitialState extends ByMonthState {
  @override
  List<Object?> get props => [];
}

class ByMonthLoadingState extends ByMonthState {
  @override
  List<Object?> get props => [];
}

class ByMonthLoadedState extends ByMonthState {
  ByMonthLoadedState({required this.monthlyReport});

  final MonthlyReportEntity monthlyReport;

  @override
  List<Object?> get props => [monthlyReport];
}

class ByMonthErrorState extends ByMonthState {
  ByMonthErrorState();

  @override
  List<Object?> get props => [];
}

class ByMonthEmptyState extends ByMonthState {
  ByMonthEmptyState();

  @override
  List<Object?> get props => [];
}
