import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: progressIndicatorSize,
          height: progressIndicatorSize,
          child: const CircularProgressIndicator(),
        ),
        SizedBox(height: vMediumSpace),
        Text(
          MonthlyDI.I.get<HomeStrings>().homeLoading,
          style: TextStyle(
            fontSize: subTitleTextSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
