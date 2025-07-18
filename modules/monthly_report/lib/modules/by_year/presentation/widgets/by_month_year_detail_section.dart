import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ByMonthYearDetailSection extends StatelessWidget {
  const ByMonthYearDetailSection({
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
    required this.locale,
    super.key,
    this.onTap,
  });
  final String title;
  final double amount;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final String locale;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(defaultRadius),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hNormalSpace,
            vertical: vNormalSpace,
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: defaultIconSize),
              SizedBox(width: hNormalSpace),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.cardTitleColor,
                      ),
                    ),
                    SizedBox(height: vSpace4),
                    Text(
                      amount.formatToCurrency(locale),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.cardSubtTitleColor,
                        fontSize: subTitleTextSize,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: arrowIconSize,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
