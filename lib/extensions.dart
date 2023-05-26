import 'package:flutter/material.dart';

extension CustomCases on String {
  /// Converts a "camelCaseString" to a "Spaced Title Case String".
  /// - "helloWorld" -> "Hello World"
  /// - "hello" -> "Hello"
  String get camelCaseToSpacedTitleCase {
    // TODO Check if the first 2 conditions are useful
    if (length == 0) {
      return this;
    }
    if (length == 1) {
      return toUpperCase();
    }
    return split(RegExp("(?=[A-Z])"))
        .map((word) => "${word[0].toUpperCase()}${word.substring(1)}")
        .join(" ");
  }
}

extension SizedBoxFromDouble on double {
  get verticalSpace => SizedBox(height: this);
  get horizontalSpace => SizedBox(width: this);
}

extension DurationFromInt on int {
  get seconds => Duration(seconds: this);
  get milliseconds => Duration(milliseconds: this);
}

extension PaddingFromDouble on double {
  get all => EdgeInsets.all(this);
  get horizontal => EdgeInsets.symmetric(horizontal: this);
  get onlyBottom => EdgeInsets.only(bottom: this);
}

extension PaddingFromListDouble on List<double> {
  get fromLTRB {
    if (length == 4) {
      return EdgeInsets.fromLTRB(this[0], this[1], this[2], this[3]);
    }
    // TODO Add exception
    return EdgeInsets.zero;
  }

  get verticalHorizontal {
    if (length == 2) {
      return EdgeInsets.symmetric(vertical: this[0], horizontal: this[1]);
    }
    // TODO Add exception
    return EdgeInsets.zero;
  }
}

extension ThemeFromContext on BuildContext {
  // UTILS
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  // TEXT THEME'S STYLES
  TextStyle get titleLarge => textTheme.titleLarge!;

  // APP'S STYLES
  TextStyle? get tileTitle => textTheme.titleSmall;
  TextStyle? get appAccordionTitle =>
      tileTitle?.copyWith(fontWeight: FontWeight.bold);

  // APP'S COLOR SCHEME: SECONDARY
  Color get dropdownMenuColor => colorScheme.secondary;
}