import 'package:flutter/material.dart';
import 'package:monthly_ui_components/dimen/app_sizes.dart';
import 'package:monthly_ui_components/themes/app_themes.dart';

class GradientBoxWidget extends StatelessWidget {
  const GradientBoxWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryDark.withValues(alpha: 0.7),
            AppColors.primary,
            const Color(0xFF0F1A3A),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: defaultRadius,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: AppColors.primaryLight.withValues(alpha: 0.1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: hNormalSpace,
        vertical: vNormalSpace,
      ),
      child: child,
    );
  }
}
