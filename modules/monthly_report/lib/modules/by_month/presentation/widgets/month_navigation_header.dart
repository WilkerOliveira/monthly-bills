import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_report/core/translation/report_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class MonthNavigationHeader extends StatelessWidget {
  const MonthNavigationHeader({
    required this.pageController,
    required this.strings,
    required this.month,
    required this.year,
    super.key,
  });
  final PageController pageController;
  final ReportStrings strings;
  final int month;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: vSmallSpace,
        horizontal: hTinySpace,
      ),
      color: AppColors.primary.withValues(alpha: 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
          ),
          Text(
            '${getMonthName(month, strings.locale)} $year',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
