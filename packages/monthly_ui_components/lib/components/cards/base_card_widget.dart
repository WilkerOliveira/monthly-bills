import 'package:flutter/material.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({required this.onTap, required this.child, super.key});
  final void Function() onTap;
  final Widget child;

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
          child: child,
        ),
      ),
    );
  }
}
