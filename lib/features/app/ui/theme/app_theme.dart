import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ///--------------- Configuración DarkTheme-------------------------------------------------
  static const colorsDark = ColorsTheme.darkColorScheme;
  ThemeData dark = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.quicksandTextTheme(),
    colorScheme: colorsDark,
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(20),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorsDark.primary, width: 2),
            borderRadius: BorderRadius.circular(30)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorsDark.error),
            borderRadius: BorderRadius.circular(30)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorsDark.error),
            borderRadius: BorderRadius.circular(30)),
        errorStyle: TextStyle(color: Colors.white, fontSize: 14)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            )))),
  );
}

extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  TextStyle? get displayLarge => textTheme.displayLarge?.copyWith();
  TextStyle? get displayMedium => textTheme.displayMedium?.copyWith();
  TextStyle? get displaySmall => textTheme.displaySmall?.copyWith();
  TextStyle? get headlineLarge => textTheme.headlineLarge?.copyWith();
  TextStyle? get headlineMedium => textTheme.headlineMedium?.copyWith();
  TextStyle? get headlineSmall => textTheme.headlineSmall?.copyWith();
  TextStyle? get titleLarge => textTheme.titleLarge
      ?.copyWith(color: theme.colorScheme.onBackground, fontSize: 30);
  TextStyle? get titleMedium => textTheme.titleMedium?.copyWith();
  TextStyle? get titleSmall => textTheme.titleSmall
      ?.copyWith(color: theme.colorScheme.onBackground, fontSize: 20);
  TextStyle? get labelLarge => textTheme.labelLarge?.copyWith();
  TextStyle? get labelMedium => textTheme.labelMedium?.copyWith();
  TextStyle? get labelSmall => textTheme.labelSmall?.copyWith();
  TextStyle? get bodyLarge => textTheme.bodyLarge?.copyWith();
  TextStyle? get bodyMedium =>
      textTheme.bodyMedium?.copyWith(color: Colors.grey);
  TextStyle? get bodySmall =>
      textTheme.bodySmall?.copyWith(color: Colors.white);
}

class ColorsTheme {
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffeb386f),
    onPrimary: Colors.black,
    secondary: Color(0xff70389d),
    onSecondary: Colors.black,
    tertiary: Color(0xff202737),
    background: Color(0xff121212),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.black,
    surface: Color(0xff121212),
    onSurface: Colors.white,
  );
}
  ///--------------- Configuración LightTheme-------------------------------------------------
  // static const colorslight = ColorsTheme.lightColorScheme;
  // ThemeData light = ThemeData.light().copyWith(
  //   textTheme: GoogleFonts.robotoFlexTextTheme(),
  //   colorScheme: colorslight,
  // inputDecorationTheme: InputDecorationTheme(
  //   filled: true,
  //   fillColor: colorslight.background.withOpacity(0.2),
  //   contentPadding: const EdgeInsets.all(10),
  //   enabledBorder: OutlineInputBorder(
  //       borderSide: BorderSide(
  //           style: BorderStyle.solid, color: colorslight.surface, width: 1.5),
  //       borderRadius: BorderRadius.circular(10)),
  //   focusedBorder: OutlineInputBorder(
  //       borderSide: BorderSide(
  //           style: BorderStyle.solid, color: colorslight.surface, width: 1.5),
  //       borderRadius: BorderRadius.circular(10)),
  //   focusedErrorBorder: OutlineInputBorder(
  //       borderSide: BorderSide(
  //           style: BorderStyle.solid, color: Colors.red.shade300, width: 1.5),
  //       borderRadius: BorderRadius.circular(10)),
  //   errorBorder: OutlineInputBorder(
  //       borderSide: BorderSide(
  //           style: BorderStyle.solid, color: Colors.red.shade300, width: 1.5),
  //       borderRadius: BorderRadius.circular(10)),
  // ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ButtonStyle(
  //         padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
  //             const EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
  //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //             RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(25.0),
  //         )))),
  // appBarTheme: const AppBarTheme(elevation: 0),
  //);
  // static const lightColorScheme = ColorScheme(
  //   brightness: Brightness.light,
  //   primary: Color(0xff03b3c2),
  //   onPrimary: Color(0xFFFFFFFF),
  //   primaryContainer: Color(0xFFFEFEFE),
  //   onPrimaryContainer: Color(0xFF011034),
  //   secondary: Color(0xFFe85963),
  //   onSecondary: Color(0xFFFFFFFF),
  //   secondaryContainer: Color(0xFFE2E4D5),
  //   onSecondaryContainer: Color(0xFF1A1D14),
  //   tertiary: Color(0xFF02C9AF),
  //   onTertiary: Color(0xFFFFFFFF),
  //   tertiaryContainer: Color(0xFFD5E6E3),
  //   onTertiaryContainer: Color(0xFF0F1E1C),
  //   error: Color(0xFFBA1A1A),
  //   onError: Color(0xFFFFFFFF),
  //   errorContainer: Color(0xFFBA1A1A),
  //   onErrorContainer: Color(0xFFBA1A1A),
  //   background: Color(0xFFFFFFFF),
  //   onBackground: Color(0xFF1C1C1A),
  //   surface: Color(0xFF9d9c9a),
  //   onSurface: Color(0xFF4b4b4b),
  //   surfaceVariant: Color(0xFF626461),
  //   onSurfaceVariant: Color(0xFFEAEEEF),
  //   outline: Color(0xFFC8C3C9),
  //   shadow: Color(0xFF000000),
  //   inverseSurface: Color(0xFF4b4b4b),
  //   onInverseSurface: Color(0xFFF3F0EC),
  //   inversePrimary: Color(0xFFBDCCA0),
  //   surfaceTint: Color(0xFF79A93B),
  // );