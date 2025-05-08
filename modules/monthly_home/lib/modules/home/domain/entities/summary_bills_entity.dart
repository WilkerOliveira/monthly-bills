import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';

class SummaryBillsEntity extends Equatable {
  const SummaryBillsEntity({
    required this.totalAmount,
    required this.upcomingBills,
    required this.bills,
  });
  factory SummaryBillsEntity.empty() {
    return const SummaryBillsEntity(
      totalAmount: 0,
      upcomingBills: 0,
      bills: [],
    );
  }

  final double totalAmount;
  final int upcomingBills;
  final List<Bill> bills;

  @override
  List<Object?> get props => [totalAmount, upcomingBills, bills];
}
