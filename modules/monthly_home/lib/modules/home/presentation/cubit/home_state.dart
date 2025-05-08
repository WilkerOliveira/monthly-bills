import 'package:monthly_home/modules/home/domain/entities/summary_bills_entity.dart';

sealed class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  HomeSuccessState({
    required this.bill,
    required this.isEmpty,
    required this.isError,
  });
  final bool isEmpty;
  final bool isError;
  final SummaryBillsEntity bill;
}
