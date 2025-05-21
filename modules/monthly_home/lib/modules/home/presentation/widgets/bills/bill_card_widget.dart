import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class BillCard extends StatelessWidget {
  const BillCard({required this.bill, super.key});
  final BillEntity bill;

  @override
  Widget build(BuildContext context) {
    final strings = MonthlyDI.I.get<HomeStrings>();

    final daysUntilDue = bill.dueDate.difference(DateTime.now()).inDays;

    return Card(
      margin: EdgeInsets.only(bottom: vSmallSpace),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: hMediumSpace,
          vertical: vMediumSpace,
        ),
        child: Row(
          children: [
            BillIconWidget(type: bill.name),
            SizedBox(width: hNormalSpace),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bill.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mediumTextSize,
                    ),
                  ),
                  SizedBox(height: vSpace4),
                  Text(
                    strings.homeDueUntil.replace(
                      ['%s'],
                      [daysUntilDue.toString()],
                    ),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${bill.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: mediumTextSize,
                  ),
                ),
                SizedBox(height: vTinySpace),
                SimpleButton(onPressed: () {}, label: strings.homePay),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
