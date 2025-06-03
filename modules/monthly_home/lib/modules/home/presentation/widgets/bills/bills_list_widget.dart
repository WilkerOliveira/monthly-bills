import 'package:flutter/material.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_home/modules/home/presentation/widgets/bills/header_bills_widget.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class BillsListWidget extends StatelessWidget {
  const BillsListWidget({required this.bills, super.key});
  final List<BillEntity> bills;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: vSmallSpace),
        const HeaderBillsWidget(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bills.length,
          itemBuilder: (context, index) {
            return BillCard(bill: bills[index]);
          },
        ),
      ],
    );
  }
}
