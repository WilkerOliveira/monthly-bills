import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_report/core/routers/report_routers.dart';
import 'package:monthly_report/core/translation/report_strings.dart';
import 'package:monthly_report/modules/by_year/domain/entities/year_report_entity.dart';
import 'package:monthly_report/modules/by_year/presentation/widgets/by_month_year_detail_section.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ByYearContent extends StatelessWidget {
  const ByYearContent({required this.report, required this.strings, super.key});
  final YearReportEntity report;
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
                horizontal: hSpace10,
                vertical: vSpace10,
              ),
              child: Column(
                children: [
                  Text(
                    strings.totalBills,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: subTitleTextSize,
                    ),
                  ),
                  SizedBox(height: vTinySpace),
                  Text(
                    report.total.formatToCurrency(strings.locale),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: titleTextSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: vMediumSpace),
          ListView.builder(
            itemCount: report.months.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final month = report.months[index];
              return ByMonthYearDetailSection(
                title: getMonthName(month.month, strings.locale),
                amount: month.total,
                icon: Icons.calendar_month,
                color: AppColors.primary,
                locale: strings.locale,
                onTap: () {
                  context.push(
                    ReportRoutersPath.reportByMonth,
                    extra: DateTime(report.year, month.month),
                  );
                },
              );
            },
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
