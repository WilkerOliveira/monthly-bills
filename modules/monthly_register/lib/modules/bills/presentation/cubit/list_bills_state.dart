import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';

sealed class ListBillsState extends Equatable {
  const ListBillsState();

  @override
  List<Object?> get props => [];
}

class ListBillsInitialState extends ListBillsState {
  const ListBillsInitialState();
}

class ListBillsLoadingState extends ListBillsState {
  const ListBillsLoadingState();
}

class ListBillsLoadedState extends ListBillsState {
  const ListBillsLoadedState({required this.bills});

  final List<BillEntity> bills;

  @override
  List<Object?> get props => [bills];
}

class ListBillsErrorState extends ListBillsState {
  const ListBillsErrorState();

  @override
  List<Object?> get props => [];
}

class ListBillsEmpty extends ListBillsState {
  const ListBillsEmpty();
}
