import 'package:flutter/material.dart';
import 'package:monthly_ui_components/sizes/app_size.dart';

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
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        style: TextStyle(fontSize: fontSize ?? mediumTextSize),
      ),
    );
  }
}
