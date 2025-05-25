import 'package:monthly_dependencies/monthly_dependencies.dart';

class FilterWidgetState {
  const FilterWidgetState({required this.showFilter});
  final bool showFilter;
}

class FilterWidgetCubit extends Cubit<FilterWidgetState> {
  FilterWidgetCubit() : super(const FilterWidgetState(showFilter: false));
  bool _showFilter = false;

  void showFilter() {
    _showFilter = !_showFilter;
    emit(FilterWidgetState(showFilter: _showFilter));
  }
}
