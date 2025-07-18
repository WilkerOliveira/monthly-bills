import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_report/modules/by_year/domain/entities/month_year_report_entity.dart';

class YearReportEntity extends Equatable {
  const YearReportEntity({
    required this.total,
    required this.year,
    required this.months,
  });

  factory YearReportEntity.fromBills(List<BillEntity> bills, int year) {
    final monthlyReports =
        bills
            .fold(<int, double>{}, (Map<int, double> accumulator, transaction) {
              accumulator.update(
                transaction.dueDate.month,
                (existingSum) => existingSum + transaction.amount,
                ifAbsent: () => transaction.amount,
              );
              return accumulator;
            })
            .entries
            .map(
              (entry) =>
                  MonthYearReportEntity(month: entry.key, total: entry.value),
            )
            .toList()
          ..sort((a, b) => a.month.compareTo(b.month));

    final total = monthlyReports.fold<double>(
      0,
      (sum, report) => sum + report.total,
    );

    return YearReportEntity(total: total, year: year, months: monthlyReports);
  }

  final double total;
  final int year;
  final List<MonthYearReportEntity> months;

  @override
  List<Object> get props {
    return [total, year, months];
  }
}
