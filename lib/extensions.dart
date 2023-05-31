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
  get vertical => EdgeInsets.symmetric(vertical: this);
  get onlyBottom => EdgeInsets.only(bottom: this);
  get onlyTop => EdgeInsets.only(top: this);
  get onlyRight => EdgeInsets.only(right: this);
  get onlyLeft => EdgeInsets.only(left: this);
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

extension AlignmentUtils on Alignment {
  /* Vertical */
  bool get isTop => y == -1.0;
  bool get isVerticalCenter => y == 0.0;
  bool get isBottom => y == 1.0;

  /* Horizontal */
  bool get isLeft => x == -1.0;
  bool get isHorizontalCenter => x == 0.0;
  bool get isRight => x == 1.0;

  bool get isTopLeft => isTop && isLeft;
  bool get isTopCenter => isTop && isHorizontalCenter;
  bool get isTopRight => isTop && isRight;
  bool get isCenterLeft => isVerticalCenter && isLeft;
  bool get isCenter => isVerticalCenter && isHorizontalCenter;
  bool get isCenterRight => isVerticalCenter && isRight;
  bool get isBottomLeft => isBottom && isLeft;
  bool get isBottomCenter => isBottom && isHorizontalCenter;
  bool get isBottomRight => isBottom && isRight;

  double get vOffset {
    return y;

    // OR
    if (isTop) return -1.0; // y
    if (isVerticalCenter) return 0.0; // y
    if (isBottom) return 1.0; // y
    return 1.0;
  }

  double get hOffset {
    return x;

    // OR
    if (isLeft) return -1.0; // x
    if (isHorizontalCenter) return 0.0; // x
    if (isRight) return 1.0; // x
    return 1.0;
  }

  String get name {
    if (isTopLeft) return "Top Left";
    if (isTopCenter) return "Top Center";
    if (isTopRight) return "Top Right";
    if (isCenterLeft) return "Center Left";
    if (isCenter) return "Center";
    if (isCenterRight) return "Center Right";
    if (isBottomLeft) return "Bottom Left";
    if (isBottomCenter) return "Bottom Center";
    if (isBottomRight) return "Bottom Right";
    throw Exception("Cannot detect the correct alignment.");
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
  TextStyle? get dropdownTextStyle => textTheme.titleMedium;
  TextStyle? get checkboxTextStyle => textTheme.titleMedium;

  // APP'S COLOR SCHEME: SECONDARY
  Color get dropdownMenuColor => colorScheme.secondary;

  // APP'S COLOR SCHEME: TERTIARY
  Color get alignmentPickerDot => colorScheme.tertiary;
}