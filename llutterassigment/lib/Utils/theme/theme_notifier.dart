import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeNotifier extends ChangeNotifier {
  static ThemeData get _lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: const Color(0xffFFFFFF),
      primaryColorLight: const Color(0xffE1D5F9),
      appBarTheme: const AppBarTheme(),
      dropdownMenuTheme: const DropdownMenuThemeData(),
      colorScheme: const ColorScheme(
        /// Mandatory
        brightness: Brightness.light,
        primary: Color(0xff574182),
        onPrimary: Color(0xffE1D5F9),
        secondary: Color(0xffE18308),
        onSecondary: Color(0xffFDDDB3),
        error: Color(0xffF04438),
        onError: Color(0xff574182),
        background: Color(0xff574182),
        onBackground: Color(0xff574182),
        surface: Color(0xff11A661),
        onSurface: Color(0xffE8E7EA),
        outline: Color(0xff433F54),
        onInverseSurface: Color(0xffE7F8F0),
        onPrimaryContainer: Color(0xff0D824B),
        shadow: Color(0xffFEECEB),

        /// Optional
        tertiary: Color(0xffB6B5BD),
        onTertiary: Color(0xff93919D),
        inversePrimary: Color(0xff140F29),
        onTertiaryContainer: Color(0xffFEF4E6),
        inverseSurface: Color(0xffFEECEB),
        onSecondaryContainer: Color(0xffF5F1FD),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          iconSize: const MaterialStatePropertyAll(15),
          alignment: Alignment.centerLeft,
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xffE1D5F9),
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          minimumSize: const MaterialStatePropertyAll(
            Size(50, 50),
          ),
        ),
      ),
    );
  }

  static TextTheme get _textTheme {
    return GoogleFonts.mulishTextTheme().copyWith(
      // H-1
      displayLarge: _tStyle(96, FontWeight.w800, 0xff140F29, 106),
      // H-2
      displayMedium: _tStyle(64, FontWeight.w800, 0xff140F29, 106),
      // H-3
      displaySmall: _tStyle(48, FontWeight.w800, 0xff140F29, 106),
      // H-4
      headlineLarge: _tStyle(40, FontWeight.w800, 0xff140F29, 53),
      // H-5
      headlineMedium: _tStyle(36, FontWeight.w800, 0xff140F29, 40),
      // H-6
      headlineSmall: _tStyle(32, FontWeight.w800, 0xff140F29, 24),
      // Title-3
      titleLarge: _tStyle(24, FontWeight.w800, 0xff140F29, 22),
      // Title-2
      titleMedium: _tStyle(20, FontWeight.w800, 0xff140F29, 24),
      // Title-1
      titleSmall: _tStyle(18, FontWeight.w800, 0xff140F29, 24),
      // Body
      bodyLarge: _tStyle(14, FontWeight.w800, 0xff140F29, 24),
      bodyMedium: _tStyle(14, FontWeight.w800, 0xff140F29, 21),
      bodySmall: _tStyle(14, FontWeight.w800, 0xff140F29, 21),
      // Lable
      labelLarge: _tStyle(12, FontWeight.w800, 0xff140F29, 12),
      labelMedium: _tStyle(12, FontWeight.w800, 0xff140F29, 12),
      labelSmall: _tStyle(12, FontWeight.w800, 0xff140F29, 12),
    );
  }

  static TextStyle _tStyle(
          double size, FontWeight weight, int color, double height) =>
      TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: Color(color),
      );

  /// current theme gettter
  ThemeData get lightTheme => _lightTheme;

  ThemeData get currentTheme => _lightTheme;

  TextTheme get currentTextStyle => _textTheme;
}
