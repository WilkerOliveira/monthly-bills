import 'package:flutter/material.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class BillDetailWidget extends StatelessWidget {
  const BillDetailWidget({required this.bills, required this.title, super.key});
  final List<BillEntity> bills;
  final String title;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, scrollController) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hNormalSpace,
                vertical: vNormalSpace,
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: bills.length,
                itemBuilder: (context, index) {
                  final bill = bills[index];
                  return BillCard(bill: bill, onTap: () {});
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
