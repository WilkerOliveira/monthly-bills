import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_ui_components/components/icons/circle_icon.dart';

class BillIconWidget extends StatelessWidget {
  const BillIconWidget({required this.type, super.key});

  final String type;

  @override
  Widget build(BuildContext context) {
    return CircleIcon(
      icon: Icon(type.toBillType().icon, color: Colors.blue.shade800),
    );
  }
}
