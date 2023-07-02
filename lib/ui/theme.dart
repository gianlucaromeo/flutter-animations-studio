import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* GLOBAL */

const appBorderSide = BorderSide(
  color: _AppColors.border,
  width: 0.3,
);

ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: _appFontFamily,
  colorScheme: _appColorScheme,
  scaffoldBackgroundColor: _scaffoldBackgroundColor,
  appBarTheme: _appBarTheme,
  textTheme: _appTextTheme,
  checkboxTheme: _appCheckboxThemeData,
);


/* PRIVATE */

class _AppColors {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color red = Color.fromRGBO(255, 101, 101, 1);
  static const Color border =  Color.fromRGBO(166, 166, 166, 1);
}

const _appColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromRGBO(181, 201, 154, 1),
  onPrimary: Color.fromRGBO(200, 200, 200, 1),
  secondary: Color.fromRGBO(56, 56, 56, 1),
  onSecondary: Colors.white, // TODO
  tertiary: Color.fromRGBO(107, 121, 96, 1),
  onTertiary: Color.fromRGBO(240, 240, 240, 1),
  error: _AppColors.red,
  onError: Colors.white, // TODO
  background: Color.fromRGBO(21, 21, 21, 1),
  onBackground: _AppColors.white,
  surface: Color.fromRGBO(37, 37, 37, 1),
  onSurface: _AppColors.white,
);

final _scaffoldBackgroundColor = _appColorScheme.background;

final _appBarTheme = AppBarTheme(
  backgroundColor: _appColorScheme.secondary,
  elevation: 0.0,
  titleTextStyle: _createTextStyle(
    color: _AppColors.white,
    letterSpacing: 0.6,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  ),
);

final _appCheckboxThemeData = CheckboxThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(2.0),
  ),
  overlayColor: MaterialStateProperty.all(Colors.transparent),
  splashRadius: 0.0,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fillColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return _appColorScheme.primary;
    }
    if (states.contains(MaterialState.hovered)) {
      return _appColorScheme.onPrimary;
    }
    return _AppColors.border;
  }),
  checkColor: MaterialStateProperty.all(_AppColors.white),
);

class AppBorderRadius {
  static BorderRadius get small => const BorderRadius.all(Radius.circular(4.0));
  static BorderRadius get medium => const BorderRadius.all(Radius.circular(16.0));
  static BorderRadius get large => const BorderRadius.all(Radius.circular(20.0));

  static BorderRadius custom(double radius) =>
      BorderRadius.all(Radius.circular(radius));
}

/// TEXT STYLE

final _appFontFamily = GoogleFonts.montserrat.toString();
const _appFontWeight = FontWeight.normal;

TextStyle _createTextStyle({
  required double fontSize,
  Color? color,
  double? letterSpacing,
  String? fontFamily,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    letterSpacing: 0.3,
    fontFamily: fontFamily ?? _appFontFamily,
    fontWeight: fontWeight ?? _appFontWeight,
  );
}

const _defaultTextColor = Color.fromRGBO(220, 220, 220, 1.0);

TextTheme _appTextTheme = TextTheme(
  /// TITLE MEDIUM (subtitle1):
  /// [Checkbox, Dropdown, ]
  titleMedium: _createTextStyle(
    fontSize: 12.0,
    color: _defaultTextColor,
  ),
);