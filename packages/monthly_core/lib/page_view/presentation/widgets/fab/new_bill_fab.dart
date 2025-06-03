import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

class NewBillFab extends StatelessWidget {
  const NewBillFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.push(MainRoutes.newBill);
      },
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
