import 'package:flutter/material.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class AnimatedNavIcon extends StatelessWidget {
  const AnimatedNavIcon({
    required this.icon,
    required this.activeIcon,
    required this.isActive,
    super.key,
  });
  final IconData icon;
  final IconData activeIcon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child:
          isActive
              ? Icon(
                activeIcon,
                key: ValueKey('active_$icon'),
                color:
                    Theme.of(
                      context,
                    ).extension<CustomThemeExtension>()?.navIconActiveColor,
                size: navBarIconSize,
              )
              : Icon(
                icon,
                key: ValueKey('inactive_$icon'),
                color:
                    Theme.of(
                      context,
                    ).extension<CustomThemeExtension>()?.navIconInactiveColor,
                size: navBarIconSize,
              ),
    );
  }
}
