import 'package:flutter/material.dart';
import 'package:monthly_ui_components/dimen/app_sizes.dart';
import 'package:monthly_ui_components/themes/app_themes.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    required this.label,
    required this.onPressed,
    this.buttonColor,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.secondary,
        foregroundColor: Colors.white,
        minimumSize: Size.fromHeight(minimumButtonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        elevation: 5,
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: largeTextSize),
      ),
    );
  }
}
