import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_home/core/translation/home_strings.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = MonthlyDI.I.get<HomeStrings>();
    return Column(
      children: [
        const SizedBox(height: 40),
        SizedBox(
          height: 200,
          child: Lottie.asset(
            'assets/animations/empty.json',
            package: 'monthly_home',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          strings.homeNoBillsMessage,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Text(
          strings.homeAddFirstBill,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
        ),
      ],
    );
  }
}
