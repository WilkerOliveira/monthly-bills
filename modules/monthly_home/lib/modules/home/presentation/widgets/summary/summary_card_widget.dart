import 'package:flutter/material.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    super.key,
  });
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: hSmallSpace,
        vertical: hSmallSpace,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(defaultRadius),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          SizedBox(height: vSpace6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: TextStyle(
                fontSize: subTitleTextSize,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          SizedBox(height: vSpace4),
          Text(label, style: TextStyle(color: color.withValues(alpha: 0.8))),
        ],
      ),
    );
  }
}
