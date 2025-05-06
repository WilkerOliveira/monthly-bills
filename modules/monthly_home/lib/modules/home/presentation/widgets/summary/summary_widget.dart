import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_home/modules/home/presentation/widgets/summary/summary_card_widget.dart';

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
            value: totalAmount.toStringAsFixed(2),
            label: strings.homeTotalDue,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12),
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
