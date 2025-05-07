import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/core/translation/home_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = MonthlyDI.I.get<HomeStrings>();
    return Column(
      children: [
        SizedBox(height: vBigSpace),
        SizedBox(
          height: largeImage,
          child: Lottie.asset(
            'assets/animations/empty.json',
            package: 'monthly_home',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: vNormalSpace),
        Text(
          strings.homeNoBillsMessage,
          style: TextStyle(fontSize: subTitleTextSize, color: Colors.grey),
        ),
        SizedBox(height: vTinySpace),
        Text(
          strings.homeAddFirstBill,
          style: TextStyle(
            fontSize: defaultFontSize,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
