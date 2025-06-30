import 'package:flutter/material.dart';
import 'package:monthly_ui_components/components/bottomNavBar/animated_nav_icon.dart';
import 'package:monthly_ui_components/dimen/app_sizes.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.onTap,
    required this.isActive,
    super.key,
  });
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final void Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedNavIcon(
                icon: icon,
                activeIcon: activeIcon,
                isActive: isActive,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: bottomMenuFontSize,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: isActive ? Colors.white : const Color(0xFF9E9E9E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
