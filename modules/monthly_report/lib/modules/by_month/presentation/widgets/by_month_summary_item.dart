import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ByMonthSummaryItem extends StatelessWidget {
  const ByMonthSummaryItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.locale,
    super.key,
  });

  final IconData icon;
  final String label;
  final double value;
  final Color color;
  final String locale;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: defaultIconSize),
        SizedBox(height: vSpace4),
        Text(
          label,
          style: TextStyle(
            fontSize: defaultFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: vSpace4),
        Text(
          value.formatToCurrency(locale),
          style: TextStyle(
            fontSize: subTitleTextSize,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
