import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_report/core/translation/report_strings.dart';
import 'package:monthly_report/modules/by_month/domain/entities/monthly_report_entity.dart';
import 'package:monthly_report/modules/by_month/presentation/widgets/by_month_detail_section.dart';
import 'package:monthly_report/modules/by_month/presentation/widgets/by_month_summary_item.dart';
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
                  const SizedBox(height: 8),
                  Text(
                    report.total.formatToCurrency(strings.locale),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ByMonthSummaryItem(
                        icon: Icons.check_circle,
                        label: strings.totalPaid,
                        value: report.totalPaid,
                        color: Colors.green,
                      ),
                      ByMonthSummaryItem(
                        icon: Icons.hourglass_empty,
                        label: strings.totalPending,
                        value: report.totalPending,
                        color: Colors.orange,
                      ),
                      ByMonthSummaryItem(
                        icon: Icons.warning,
                        label: strings.totalOverdue,
                        value: report.totalOverdue,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          ByMonthDetailSection(
            title: 'Contas Pagas (${report.totalPaidBills})',
            amount: report.totalPaid,
            icon: Icons.check_circle,
            color: Colors.green.shade700,
            onTap: () {
              // _showBillDetails(
              //   context,
              //   'Contas Pagas',
              //   report.month,
              //   report.year,
              //   true,
              //   false,
              // );
            },
          ),
          const SizedBox(height: 12),
          ByMonthDetailSection(
            title: 'Contas Pendentes (${report.totalPendingBills})',
            amount: report.totalPending,
            icon: Icons.hourglass_empty,
            color: Colors.orange.shade700,
            onTap: () {
              // _showBillDetails(
              //   context,
              //   'Contas Pendentes',
              //   report.month,
              //   report.year,
              //   false,
              //   false,
              // );
            },
          ),
          const SizedBox(height: 12),
          ByMonthDetailSection(
            title: 'Contas Vencidas (${report.totalOverdueBills})',
            amount: report.totalOverdue,
            icon: Icons.warning,
            color: Colors.red.shade700,
            onTap: () {
              // _showBillDetails(
              //   context,
              //   'Contas Vencidas',
              //   report.month,
              //   report.year,
              //   false,
              //   true,
              // );
            },
          ),
        ],
      ),
    );
  }
}
