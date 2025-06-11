import 'package:flutter/material.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: progressIndicatorSize,
          height: progressIndicatorSize,
          child: const CircularProgressIndicator(color: AppColors.surface),
        ),
        SizedBox(height: vMediumSpace),
        Text(
          message ?? '',
          style: TextStyle(
            fontSize: subTitleTextSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
