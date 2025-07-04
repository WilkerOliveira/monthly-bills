import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
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
            title: '${strings.pendingBills} (${report.totalPendingBills})',
            amount: report.totalPending,
            icon: Icons.hourglass_empty,
            color: Colors.orange.shade700,
            locale: strings.locale,
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
            title: '${strings.billsOverdue} (${report.totalOverdueBills})',
            amount: report.totalOverdue,
            icon: Icons.warning,
            color: Colors.red.shade700,
            locale: strings.locale,
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
