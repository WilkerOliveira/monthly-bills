import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/modules/by_year/domain/entities/year_report_entity.dart';

abstract class ByYearState extends Equatable {}

class ByYearInitialState extends ByYearState {
  @override
  List<Object?> get props => [];
}

class ByYearLoadingState extends ByYearState {
  @override
  List<Object?> get props => [];
}

class ByYearLoadedState extends ByYearState {
  ByYearLoadedState({required this.yearReportEntity});

  final YearReportEntity yearReportEntity;

  @override
  List<Object?> get props => [yearReportEntity];
}

class ByYearErrorState extends ByYearState {
  ByYearErrorState();

  @override
  List<Object?> get props => [];
}

class ByYearEmptyState extends ByYearState {
  ByYearEmptyState();

  @override
  List<Object?> get props => [];
}
