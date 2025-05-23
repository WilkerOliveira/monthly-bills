import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static const Color _primaryColor = Color(0xFF4CAF50);
  static const Color _secondaryColor = Color(0xFFA29BFE);
  static const Color _darkBackground = Color(0xFF1C1C1E);
  static const Color _darkSurface = Color(0xFF1E1E1E);
  static const Color _darkCard = Color(0xFF252525);
  static const Color _errorColor = Color(0xFFCF6679);

  static ThemeData get darkTheme {
    final baseTheme = ThemeData.dark(useMaterial3: true);

    return baseTheme.copyWith(
      colorScheme: _darkColorScheme,
      extensions: <ThemeExtension<dynamic>>[customTheme],
      scaffoldBackgroundColor: _darkBackground,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: _appBarTheme,
      cardTheme: _cardTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textButtonTheme: _textButtonTheme,
      checkboxTheme: _checkboxTheme,
      radioTheme: _radioTheme,
      switchTheme: _switchTheme,
      dividerTheme: _dividerTheme,
      floatingActionButtonTheme: _floatingActionButtonTheme,
      snackBarTheme: _snackBarTheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      tabBarTheme: _tabBarTheme,
      dialogTheme: _dialogTheme,
      listTileTheme: _listTileTheme,
      bottomAppBarTheme: _bottomAppBarTheme,
    );
  }

  static ColorScheme get _darkColorScheme => const ColorScheme.dark(
    primary: _primaryColor,
    secondary: _secondaryColor,
    surface: _darkSurface,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onError: Colors.white,
  );

  static AppBarTheme get _appBarTheme => AppBarTheme(
    backgroundColor: _darkSurface,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: _textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    scrolledUnderElevation: 2,
  );

  static CardTheme get _cardTheme => CardTheme(
    color: _darkCard,
    margin: const EdgeInsets.all(8),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    surfaceTintColor: Colors.transparent,
  );

  static TextTheme get _textTheme => GoogleFonts.poppinsTextTheme().copyWith(
    displayLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.grey[300],
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: _darkSurface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: _primaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: _errorColor),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    labelStyle: TextStyle(color: Colors.grey[400]),
    hintStyle: TextStyle(color: Colors.grey[500]),
    floatingLabelStyle: const TextStyle(color: _primaryColor),
  );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: _textTheme.labelLarge,
          elevation: 2,
          shadowColor: Colors.transparent,
        ),
      );

  static OutlinedButtonThemeData get _outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.grey[700]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: _textTheme.labelLarge,
        ),
      );

  static TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _primaryColor,
      textStyle: _textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
    ),
  );

  static CheckboxThemeData get _checkboxTheme => CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return _primaryColor;
      }
      return Colors.grey[700]!;
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    side: BorderSide(color: Colors.grey[700]!),
    checkColor: WidgetStateProperty.all(Colors.white),
  );

  static RadioThemeData get _radioTheme => RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return _primaryColor;
      }
      return Colors.grey[700]!;
    }),
  );

  static SwitchThemeData get _switchTheme => SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return _primaryColor;
      }
      return Colors.grey[700]!;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return _primaryColor.withValues(alpha: .5);
      }
      return Colors.grey[800]!;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
      return Colors.transparent;
    }),
  );

  static DividerThemeData get _dividerTheme =>
      DividerThemeData(color: Colors.grey[800], thickness: 1, space: 1);

  static FloatingActionButtonThemeData get _floatingActionButtonTheme =>
      FloatingActionButtonThemeData(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      );

  static SnackBarThemeData get _snackBarTheme => SnackBarThemeData(
    backgroundColor: _darkCard,
    contentTextStyle: const TextStyle(color: Colors.white),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    actionTextColor: _primaryColor,
  );

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        backgroundColor: _darkSurface,
        selectedItemColor: _primaryColor,
        unselectedItemColor: Colors.grey[500],
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      );

  static TabBarTheme get _tabBarTheme => TabBarTheme(
    labelColor: _primaryColor,
    unselectedLabelColor: Colors.grey[500],
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(width: 2, color: _primaryColor),
    ),
    dividerColor: Colors.transparent,
    tabAlignment: TabAlignment.fill,
  );

  static DialogTheme get _dialogTheme => DialogTheme(
    backgroundColor: _darkSurface,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    titleTextStyle: _textTheme.titleLarge,
    contentTextStyle: _textTheme.bodyMedium,
  );

  static ListTileThemeData get _listTileTheme => ListTileThemeData(
    tileColor: _darkSurface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
  );

  static CustomThemeExtension get customTheme => const CustomThemeExtension(
    cardBackground: _darkCard,
    successColor: Color(0xFF4CAF50),
    warningColor: Color(0xFFFFC107),
    navIconActiveColor: Color(0xFFFFB74D),
    navIconInactiveColor: Color(0xFFA5A5A5),
  );

  static BottomAppBarTheme get _bottomAppBarTheme => const BottomAppBarTheme(
    color: Color(0xFF2D2D2D),
    elevation: 8,
    surfaceTintColor: Colors.transparent,
    shape: CircularNotchedRectangle(),
  );
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  const CustomThemeExtension({
    required this.cardBackground,
    required this.successColor,
    required this.warningColor,
    required this.navIconActiveColor,
    required this.navIconInactiveColor,
  });
  final Color cardBackground;
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
      cardBackground: cardBackground ?? this.cardBackground,
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
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      navIconActiveColor:
          Color.lerp(navIconActiveColor, other.navIconActiveColor, t)!,
      navIconInactiveColor:
          Color.lerp(navIconInactiveColor, other.navIconInactiveColor, t)!,
    );
  }
}
