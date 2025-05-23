import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_core/translation/core_strings.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = MonthlyDI.I.get<CoreStrings>();

    return BottomAppBar(
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home_rounded,
            index: 0,
            label: strings.menuHome,
          ),
          BottomNavItem(
            icon: Icons.wallet_outlined,
            activeIcon: Icons.wallet_rounded,
            index: 1,
            label: strings.menuBills,
          ),
          const SizedBox(width: 40),
          BottomNavItem(
            icon: Icons.assessment_outlined,
            activeIcon: Icons.assessment_rounded,
            index: 2,
            label: strings.menuReports,
          ),
          BottomNavItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person_rounded,
            index: 3,
            label: strings.menuProfile,
          ),
        ],
      ),
    );
  }
}
