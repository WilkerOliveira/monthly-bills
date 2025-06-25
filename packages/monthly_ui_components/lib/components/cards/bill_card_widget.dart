import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_ui_components/core/translation/ui_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class BillCard extends StatelessWidget {
  const BillCard({required this.bill, required this.onTap, super.key});
  final BillEntity bill;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.background,
        margin: EdgeInsets.only(bottom: vSmallSpace),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hSmallSpace,
            vertical: vSmallSpace,
          ),
          child: Row(
            children: [
              BillIconWidget(type: bill.category),
              SizedBox(width: hNormalSpace),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      bill.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: mediumTextSize,
                        color: AppColors.cardTitleColor,
                      ),
                    ),
                    SizedBox(height: vSpace6),
                    RichText(
                      text: TextSpan(
                        text: '${UIStrings.I.dueDate} ',
                        style: const TextStyle(
                          color: AppColors.cardSubtTitleColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: bill.dueDate.toLocaleDateFormat(
                              UIStrings.I.locale,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _getDueDateColor(bill),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: vTinySpace),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            bill.amount.formatToCurrency(UIStrings.I.locale),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: largeTextSize,
                              color: AppColors.highlightedCardColor,
                            ),
                          ),
                        ),
                        if (bill.paid)
                          Icon(
                            Icons.check_circle,
                            color: _getDueDateColor(bill),
                          )
                        else
                          Icon(Icons.pending, color: _getDueDateColor(bill)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDueDateColor(BillEntity bill) {
    if (bill.paid || bill.isFutureDueDate) {
      return AppColors.futureExpireColor;
    }

    if (bill.isDueDateExpired) {
      return AppColors.expiredColor;
    }

    return AppColors.expiringColor;
  }
}
