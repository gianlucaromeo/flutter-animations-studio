import 'package:flutter/material.dart';

class AppCurve {
  const AppCurve(this.curve, this.name);

  final Curve curve;
  final String name;
}

enum AppCurves {

  /*
      https://api.flutter.dev/flutter/animation/Curves-class.html

      With explanation video
  */

  bounceIn(AppCurve(Curves.bounceIn, "bounceIn")),
  bounceInOut(AppCurve(Curves.bounceInOut, "bounceInOut")),
  bounceOut(AppCurve(Curves.bounceOut, "bounceOut")),

  decelerate(AppCurve(Curves.decelerate, "decelerate")),

  ease(AppCurve(Curves.ease, "ease")),

  easeIn(AppCurve(Curves.easeIn, "easeIn")),
  easeInSine(AppCurve(Curves.easeInSine, "easeInSine")),
  easeInQuad(AppCurve(Curves.easeInQuad, "easeInQuad")),
  easeInCubic(AppCurve(Curves.easeInCubic, "easeInCubic")),
  easeInQuart(AppCurve(Curves.easeInQuart, "easeInQuart")),
  easeInQuint(AppCurve(Curves.easeInQuint, "easeInQuint")),
  easeInExpo(AppCurve(Curves.easeInExpo, "easeInExpo")),
  easeInCirc(AppCurve(Curves.easeInCirc, "easeInCirc")),
  easeInBack(AppCurve(Curves.easeInBack, "easeInBack")),

  easeInOut(AppCurve(Curves.easeInOut, "easeInOut")),
  easeInOutSine(AppCurve(Curves.easeInOutSine, "easeInOutSine")),
  easeInOutQuad(AppCurve(Curves.easeInOutQuad, "easeInOutQuad")),
  easeInOutCubic(AppCurve(Curves.easeInOutCubic, "easeInOutCubic")),
  easeInOutQuart(AppCurve(Curves.easeInOutQuart, "easeInOutQuart")),
  easeInOutQuint(AppCurve(Curves.easeInOutQuint, "easeInOutQuint")),
  easeInOutExpo(AppCurve(Curves.easeInOutExpo, "easeInOutExpo")),
  easeInOutCirc(AppCurve(Curves.easeInOutCirc, "easeInOutCirc")),
  easeInOutBack(AppCurve(Curves.easeInOutBack, "easeInOutBack")),

  easeOut(AppCurve(Curves.easeOut, "easeOut")),
  easeOutSine(AppCurve(Curves.easeOutSine, "easeOutSine")),
  easeOutQuad(AppCurve(Curves.easeOutQuad, "easeOutQuad")),
  easeOutCubic(AppCurve(Curves.easeOutCubic, "easeOutCubic")),
  easeOutQuart(AppCurve(Curves.easeOutQuart, "easeOutQuart")),
  easeOutQuint(AppCurve(Curves.easeOutQuint, "easeOutQuint")),
  easeOutExpo(AppCurve(Curves.easeOutExpo, "easeOutExpo")),
  easeOutCirc(AppCurve(Curves.easeOutCirc, "easeOutCirc")),
  easeOutBack(AppCurve(Curves.easeOutBack, "easeOutBack")),

  elasticIn(AppCurve(Curves.elasticIn, "elasticIn")),
  elasticInOut(AppCurve(Curves.elasticInOut, "elasticInOut")),
  elasticOut(AppCurve(Curves.elasticOut, "elasticOut")),

  fastOutSlowIn(AppCurve(Curves.fastOutSlowIn, "fastOutSlowIn")),
  slowMiddle(AppCurve(Curves.slowMiddle, "slowMiddle")),
  linear(AppCurve(Curves.linear, "linear")),


  /*
      Without explanation video
  */
  fastEaseInToSlowEaseOut(AppCurve(Curves.fastEaseInToSlowEaseOut, "fastEaseInToSlowEaseOut")),
  fastLinearToSlowEaseIn(AppCurve(Curves.fastLinearToSlowEaseIn, "fastLinearToSlowEaseIn")),
  easeInOutCubicEmphasized(AppCurve(Curves.easeInOutCubicEmphasized, "easeInOutCubicEmphasized")),
  linearToEaseOut(AppCurve(Curves.linearToEaseOut, "linearToEaseOut"));

  const AppCurves(this.appCurve);

  final AppCurve appCurve;
}

extension PreviousAndNext on AppCurve {
  AppCurve get previous {
    const appCurves = AppCurves.values;
    int currentIndex = appCurves.firstWhere((appCurves) => appCurves.appCurve == this).index;
    int previousIndex = currentIndex == 0
        ? appCurves.length - 1
        : currentIndex - 1;
    return appCurves[previousIndex].appCurve;
  }

  AppCurve get next {
    const appCurves = AppCurves.values;
    int currentIndex = appCurves.firstWhere((appCurves) => appCurves.appCurve == this).index;
    int nextIndex = currentIndex == appCurves.length - 1
        ? 0
        : currentIndex + 1;
    return appCurves[nextIndex].appCurve;
  }
}