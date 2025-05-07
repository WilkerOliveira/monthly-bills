import 'package:flutter/material.dart';
import 'package:monthly_ui_components/sizes/app_size.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({required this.icon, super.key});

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: hSmallSpace,
        vertical: vSmallSpace,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }
}
