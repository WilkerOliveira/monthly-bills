import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_report/core/translation/report_strings.dart';
import 'package:monthly_report/modules/by_month/domain/entities/monthly_report_entity.dart';
import 'package:monthly_report/modules/by_month/presentation/widgets/by_month_detail_section.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ByMonthContent extends StatelessWidget {
  const ByMonthContent({
    required this.report,
    required this.strings,
    super.key,
  });
  final MonthlyReportEntity report;
  final ReportStrings strings;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: hNormalSpace,
        vertical: vNormalSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: AppColors.onBackground,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hSpace20,
                vertical: vSpace20,
              ),
              child: Column(
                children: [
                  Text(
                    strings.totalBills,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: vTinySpace),
                  Text(
                    report.total.formatToCurrency(strings.locale),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: vNormalSpace),
                ],
              ),
            ),
          ),
          SizedBox(height: vMediumSpace),
          ByMonthDetailSection(
            title: '${strings.paidBills} (${report.totalPaidBills})',
            amount: report.totalPaid,
            icon: Icons.check_circle,
            color: Colors.green.shade700,
            locale: strings.locale,
            onTap: () {
              _showBillDetails(
                context,
                strings.paidBills,
                report.month,
                report.year,
                true,
                false,
                report.bills,
                strings,
              );
            },
          ),
          const SizedBox(height: 12),
          ByMonthDetailSection(
            title: '${strings.pendingBills} (${report.totalPendingBills})',
            amount: report.totalPending,
            icon: Icons.hourglass_empty,
            color: Colors.orange.shade700,
            locale: strings.locale,
            onTap: () {
              _showBillDetails(
                context,
                strings.pendingBills,
                report.month,
                report.year,
                false,
                false,
                report.bills,
                strings,
              );
            },
          ),
          const SizedBox(height: 12),
          ByMonthDetailSection(
            title: '${strings.billsOverdue} (${report.totalOverdueBills})',
            amount: report.totalOverdue,
            icon: Icons.warning,
            color: Colors.red.shade700,
            locale: strings.locale,
            onTap: () {
              _showBillDetails(
                context,
                strings.billsOverdue,
                report.month,
                report.year,
                false,
                true,
                report.bills,
                strings,
              );
            },
          ),
        ],
      ),
    );
  }

  void _showBillDetails(
    BuildContext context,
    String title,
    int month,
    int year,
    bool paid,
    bool overdue,
    List<BillEntity> bills,
    ReportStrings strings,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.3,
          maxChildSize: 0.95,
          expand: false,
          builder: (_, scrollController) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: bills.length,
                    itemBuilder: (context, index) {
                      final bill = bills[index];
                      return ListTile(
                        leading: Icon(
                          bill.paid
                              ? Icons.check_circle
                              : (bill.isDueDateExpired
                                  ? Icons.warning
                                  : Icons.access_time),
                          color:
                              bill.paid
                                  ? Colors.green
                                  : (bill.isDueDateExpired
                                      ? Colors.red
                                      : Colors.orange),
                        ),
                        title: Text(bill.name),
                        subtitle: Text(
                          '${bill.category} - ${strings.dueDate}: ${bill.dueDate.toLocaleDateFormat(strings.locale)}',
                        ),
                        trailing: Text(
                          'R\$ ${bill.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: bill.paid ? Colors.green : Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
