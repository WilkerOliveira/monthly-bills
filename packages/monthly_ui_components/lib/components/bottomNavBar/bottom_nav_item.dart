import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_ui_components/components/bottomNavBar/animated_nav_icon.dart';
import 'package:monthly_core/page_view/presentation/pages/cubit/navigation_cubit.dart';
import 'package:monthly_core/page_view/presentation/pages/cubit/navigation_state.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.index,
    required this.label,
    super.key,
  });
  final IconData icon;
  final IconData activeIcon;
  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            context.read<NavigationCubit>().updateIndex(index);
            _onItemTapped(index, context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<NavigationCubit, NavigationState>(
                builder: (context, state) {
                  return AnimatedNavIcon(
                    icon: icon,
                    activeIcon: activeIcon,
                    isActive: state.currentIndex == index,
                  );
                },
              ),
              const SizedBox(height: 4),
              BlocBuilder<NavigationCubit, NavigationState>(
                builder: (context, state) {
                  return Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          state.currentIndex == index
                              ? FontWeight.w600
                              : FontWeight.w500,
                      color:
                          state.currentIndex == index
                              ? Colors.white
                              : const Color(0xFF9E9E9E),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
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
