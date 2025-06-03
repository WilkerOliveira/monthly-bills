import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme({required bool isDark}) {
  final primaryColor = isDark ? AppColors.primaryDark : AppColors.primary;
  final surfaceColor = isDark ? AppColors.onSurface : AppColors.surface;
  final textColor = isDark ? Colors.white : const Color.fromRGBO(51, 65, 85, 1);

  return ThemeData(
    useMaterial3: true,
    brightness: isDark ? Brightness.dark : Brightness.light,
    extensions: <ThemeExtension<dynamic>>[customTheme],
    colorScheme: ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      error: AppColors.error,
      onError: Colors.white,
      surface: surfaceColor,
      onSurface: textColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surfaceColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey.shade600,
      elevation: 4,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondary,
      foregroundColor: Colors.white,
    ),
    inputDecorationTheme: _inputDecorationTheme,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: AppColors.primaryLight,
      selectionHandleColor: Colors.white,
    ),
  );
}

InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.surface),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Color.fromARGB(255, 132, 130, 130)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.secondary, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.error),
  ),
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  labelStyle: TextStyle(color: Colors.grey[400]),
  hintStyle: TextStyle(color: Colors.grey[500]),
  floatingLabelStyle: const TextStyle(color: Colors.white),
);

CustomThemeExtension get customTheme => const CustomThemeExtension(
  successColor: Color(0xFF4CAF50),
  warningColor: Color(0xFFFFC107),
  navIconActiveColor: Color(0xFFFFB74D),
  navIconInactiveColor: Color(0xFFA5A5A5),
);

class AppColors {
  static const Color primary = Color(0xFF1E3A8A);
  static const Color primaryDark = Color(0xFF172554);
  static const Color primaryLight = Color(0xFF3B82F6);

  static const Color secondary = Color(0xFF0D9488);
  static const Color secondaryLight = Color(0xFF2DD4BF);

  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1E293B);
  static const Color onBackground = Color(0xFF334155);

  static const Color error = Color(0xFFDC2626);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);

  static const Color cardTitleColor = Color(0xFF172554);
  static const Color cardSubtTitleColor = Color(0xFF4F4F50);
  static const Color highlightedCardColor = Color(0xFF007BFF);
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  const CustomThemeExtension({
    required this.successColor,
    required this.warningColor,
    required this.navIconActiveColor,
    required this.navIconInactiveColor,
  });
  final Color successColor;
  final Color warningColor;
  final Color navIconActiveColor;
  final Color navIconInactiveColor;

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? cardBackground,
    Color? successColor,
    Color? warningColor,
    Color? navIconActiveColor,
    Color? navIconInactiveColor,
  }) {
    return CustomThemeExtension(
      successColor: successColor ?? this.successColor,
      warningColor: warningColor ?? this.warningColor,
      navIconActiveColor: navIconActiveColor ?? this.navIconActiveColor,
      navIconInactiveColor: navIconInactiveColor ?? this.navIconInactiveColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
    covariant ThemeExtension<CustomThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomThemeExtension) {
      return this;
    }

    return CustomThemeExtension(
      successColor: Color.lerp(successColor, other.successColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      navIconActiveColor:
          Color.lerp(navIconActiveColor, other.navIconActiveColor, t)!,
      navIconInactiveColor:
          Color.lerp(navIconInactiveColor, other.navIconInactiveColor, t)!,
    );
  }
}
