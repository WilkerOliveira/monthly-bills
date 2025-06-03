import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';

sealed class BillState extends Equatable {
  const BillState();

  @override
  List<Object?> get props => [];
}

class BillInitial extends BillState {
  const BillInitial();
}

class BillLoading extends BillState {
  const BillLoading();
}

class BillLoaded extends BillState {
  const BillLoaded({required this.bill});

  final BillEntity bill;

  @override
  List<Object?> get props => [bill];
}

class BillSavedState extends BillState {
  const BillSavedState();

  @override
  List<Object?> get props => [];
}

class BillError extends BillState {
  const BillError();

  @override
  List<Object?> get props => [];
}

class BillDeleted extends BillState {
  const BillDeleted();

  @override
  List<Object?> get props => [];
}
