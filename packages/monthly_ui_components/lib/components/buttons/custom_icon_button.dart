import 'package:flutter/material.dart';
import 'package:monthly_ui_components/dimen/app_sizes.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    super.key,
    this.fontSize,
  });

  final VoidCallback onPressed;
  final Widget icon;
  final String label;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: hSmallSpace,
          vertical: vSpace6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
      ),
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        style: TextStyle(fontSize: fontSize ?? mediumTextSize),
      ),
    );
  }
}
