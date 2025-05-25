import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_core/page_view/presentation/pages/cubit/navigation_cubit.dart';
import 'package:monthly_core/translation/core_strings.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({required this.currentIndex, super.key});

  final int currentIndex;

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
            isActive: currentIndex == 0,
            label: strings.menuHome,
            onTap: () => _onItemTapped(context, 0),
          ),
          BottomNavItem(
            icon: Icons.wallet_outlined,
            activeIcon: Icons.wallet_rounded,
            isActive: currentIndex == 1,
            label: strings.menuBills,
            onTap: () => _onItemTapped(context, 1),
          ),
          const SizedBox(width: 40),
          BottomNavItem(
            icon: Icons.assessment_outlined,
            activeIcon: Icons.assessment_rounded,
            isActive: currentIndex == 2,
            label: strings.menuReports,
            onTap: () => _onItemTapped(context, 2),
          ),
          BottomNavItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person_rounded,
            isActive: currentIndex == 3,
            label: strings.menuProfile,
            onTap: () => _onItemTapped(context, 3),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    context.read<NavigationCubit>().updateIndex(index);
    _changeTab(index, context);
  }

  void _changeTab(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(MainRoutes.home);
      case 1:
        context.go(MainRoutes.bills);
      case 2:
        context.go(MainRoutes.monthlyReport);
    }
  }
}
