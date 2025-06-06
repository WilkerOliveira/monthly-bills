import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_home/modules/home/presentation/widgets/summary/summary_card_widget.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({
    required this.totalAmount,
    required this.upcomingBills,
    super.key,
  });

  final double totalAmount;
  final int upcomingBills;

  @override
  Widget build(BuildContext context) {
    final strings = MonthlyDI.I.get<HomeStrings>();
    return Row(
      children: [
        Expanded(
          child: SummaryCard(
            icon: Icons.receipt,
            value: totalAmount.formatToCurrency(strings.locale),
            label: strings.homeTotalDue,
            color: Colors.white,
          ),
        ),
        SizedBox(width: hSmallSpace),
        Expanded(
          child: SummaryCard(
            icon: Icons.calendar_today,
            value: upcomingBills.toString(),
            label: strings.homeUpcoming,
            color: Colors.amber.shade200,
          ),
        ),
      ],
    );
  }
}
