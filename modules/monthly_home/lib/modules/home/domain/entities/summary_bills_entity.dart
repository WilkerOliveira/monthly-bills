import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';

class SummaryBillsEntity extends Equatable {
  const SummaryBillsEntity({
    required this.totalAmount,
    required this.upcomingBills,
    required this.bills,
    required this.startDate,
    required this.endDate,
  });
  factory SummaryBillsEntity.empty() {
    return SummaryBillsEntity(
      totalAmount: 0,
      upcomingBills: 0,
      bills: const [],
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    );
  }

  final double totalAmount;
  final int upcomingBills;
  final List<BillEntity> bills;
  final DateTime startDate;
  final DateTime endDate;

  @override
  List<Object?> get props => [
    totalAmount,
    upcomingBills,
    bills,
    startDate,
    endDate,
  ];
}
