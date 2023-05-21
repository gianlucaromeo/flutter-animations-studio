import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* GLOBAL */

const appBorderSide = BorderSide(
  color: _AppColors.grey166,
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
  static const Color purple = Color.fromRGBO(178, 101, 255, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color red = Color.fromRGBO(255, 101, 101, 1);
  static const Color dark27 = Color.fromRGBO(27, 27, 27, 1);
  static const Color dark21 = Color.fromRGBO(21, 21, 21, 1);
  static const Color grey70 =  Color.fromRGBO(70, 70, 70, 1);
  static const Color grey157 =  Color.fromRGBO(157, 157, 157, 1);
  static const Color grey166 =  Color.fromRGBO(166, 166, 166, 1);
}

const _appColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: _AppColors.purple,
  onPrimary: _AppColors.white,
  secondary: Colors.red, // TODO
  onSecondary: Colors.green, // TODO
  error: _AppColors.red,
  onError: Colors.orange, // TODO
  background: _AppColors.dark21,
  onBackground: _AppColors.white,
  surface: _AppColors.dark27,
  onSurface: _AppColors.white,
);

const _scaffoldBackgroundColor = _AppColors.dark21;

const _appBarTheme = AppBarTheme(
  backgroundColor: _AppColors.dark27,
  elevation: 0.0,
  shape: Border(
    bottom: appBorderSide,
  ),
  titleTextStyle: TextStyle(
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
  fillColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return _AppColors.grey157;
    }
    if (states.contains(MaterialState.hovered)) {
      return _appColorScheme.onPrimary;
    }
    return _AppColors.grey166;
  }),
  checkColor: MaterialStateProperty.resolveWith((states) {
    return _AppColors.white;
  }),
);


/// TEXT STYLE

final _appFontFamily = GoogleFonts.montserrat.toString();
const _appFontWeight = FontWeight.normal;

TextStyle _createTextStyle({
  required double fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize,
    letterSpacing: 0.2,
    fontFamily: fontFamily ?? _appFontFamily,
    fontWeight: fontWeight ?? _appFontWeight,
  );
}

TextTheme _appTextTheme = TextTheme(
  /// TITLE LARGE (headline6): Checkbox
  titleLarge: _createTextStyle(
    fontSize: 12.0,
  ),
);