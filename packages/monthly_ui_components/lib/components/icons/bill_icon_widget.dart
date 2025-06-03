import 'package:flutter/material.dart';
import 'package:monthly_ui_components/components/dropdowm/bill_type_enum.dart';
import 'package:monthly_ui_components/components/icons/circle_icon.dart';

class BillIconWidget extends StatelessWidget {
  const BillIconWidget({required this.type, super.key});

  final String type;

  @override
  Widget build(BuildContext context) {
    return CircleIcon(
      icon: Icon(
        BillTypesEnum.toBillType(type).icon,
        color: Colors.blue.shade800,
      ),
    );
  }
}
