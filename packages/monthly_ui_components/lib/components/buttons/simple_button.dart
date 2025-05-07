import 'package:flutter/material.dart';
import 'package:monthly_ui_components/sizes/app_size.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({required this.label, required this.onPressed, super.key});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
      child: Text(label),
    );
  }
}
