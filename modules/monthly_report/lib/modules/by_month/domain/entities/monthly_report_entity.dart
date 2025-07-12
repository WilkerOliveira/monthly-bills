import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';

class MonthlyReportEntity extends Equatable {
  const MonthlyReportEntity({
    required this.total,
    required this.totalPaid,
    required this.totalPending,
    required this.totalOverdue,
    required this.totalBills,
    required this.totalPaidBills,
    required this.totalPendingBills,
    required this.totalOverdueBills,
    required this.month,
    required this.year,
    required this.bills,
  });

  factory MonthlyReportEntity.fromBills(
    List<BillEntity> bills,
    int month,
    int year,
  ) {
    var total = 0.0;
    var totalPaid = 0.0;
    var totalPending = 0.0;
    var totalOverdue = 0.0;

    var totalBills = 0;
    var totalPaidBills = 0;
    var totalPendingBills = 0;
    var totalOverdueBills = 0;

    totalBills = bills.length;

    for (final bill in bills) {
      total += bill.amount;

      if (bill.paid) {
        totalPaid += bill.amount;
        totalPaidBills++;
      } else if (bill.isFutureDueDate || bill.isDueDateExpiringToday) {
        totalPending += bill.amount;
        totalPendingBills++;
      } else {
        totalOverdue += bill.amount;
        totalOverdueBills++;
      }
    }

    return MonthlyReportEntity(
      total: total,
      totalPaid: totalPaid,
      totalPending: totalPending,
      totalOverdue: totalOverdue,
      totalBills: totalBills,
      totalPaidBills: totalPaidBills,
      totalPendingBills: totalPendingBills,
      totalOverdueBills: totalOverdueBills,
      month: month,
      year: year,
      bills: bills,
    );
  }

  final double total;
  final double totalPaid;
  final double totalPending;
  final double totalOverdue;
  final int totalBills;
  final int totalPaidBills;
  final int totalPendingBills;
  final int totalOverdueBills;
  final int month;
  final int year;
  final List<BillEntity> bills;

  @override
  List<Object> get props {
    return [
      total,
      totalPaid,
      totalPending,
      totalOverdue,
      totalBills,
      totalPaidBills,
      totalPendingBills,
      totalOverdueBills,
      month,
      year,
      bills,
    ];
  }
}
