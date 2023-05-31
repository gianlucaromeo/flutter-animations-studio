import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';
import 'package:flutter_animations_studio/models/app_curve.dart';
import 'package:flutter_animations_studio/ui/theme.dart';

class CurvePreview extends StatefulWidget {
  const CurvePreview({
    Key? key,
    required this.currentCurve,
    required this.previousCurve,
    required this.nextCurve,
    required this.onChangeCurve,
  }) : super(key: key);

  final AppCurve currentCurve;

  final AppCurve previousCurve;
  final AppCurve nextCurve;
  final Function(AppCurve)? onChangeCurve;

  @override
  State<CurvePreview> createState() => _CurvePreviewState();
}

const double _dotSize = 6.0;
const double _baseChartWidth = 80.0; // (without considering the dot size)
const double _chartWidth = _baseChartWidth + _dotSize;
const double _baseChartHeight = 40.0; // (without considering the dot size)
const double _chartHeight = _baseChartHeight + _dotSize;

class _CurvePreviewState extends State<CurvePreview>
    with SingleTickerProviderStateMixin {

  late Animation animation;
  late AnimationController animationController;

  double verticalOffset = 0.0;

  late Timer? timer;

  @override
  void dispose() {
    animationController.dispose();
    timer?.cancel();
    super.dispose();
  }

  Animation _createAnimation() {
    return Tween<double>(
      begin: 0,
      end: _baseChartWidth,
    ).animate(animationController);
  }


  void _restartController() {
    animationController.forward();
  }

  Timer _createTimer() {
    return Timer(1.seconds, _restartController);
  }

  void _resetController() {
    animationController.reset();
  }

  void _resetTimer() {
    timer?.cancel();
    timer = _createTimer();
  }

  void _reset() {
    _resetController();
    _resetTimer();
  }

  @override
  void didUpdateWidget(covariant CurvePreview oldWidget) {
    if (widget.currentCurve != oldWidget.currentCurve) {
      _reset();
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: 2.seconds,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _reset();
      }
    })..addListener(() {
        setState(() {
          verticalOffset = widget.currentCurve.curve
              .transform(animation.value / _baseChartWidth) *
              _baseChartHeight;
        });
      });
    animation = _createAnimation();
    timer = _createTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: [10.0, 20.0, 10.0, 0.0].fromLTRB,
      child: Column(
        children: <Widget>[

          /// CURVE DEMONSTRATION CHART
          CurveDemonstrationChart(
            animation: animation,
            verticalOffset: verticalOffset,
          ),
          10.0.verticalSpace,

          /// CHANGE CURVE BUTTONS
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _ChangeCurveButton(
                    label: widget.previousCurve.name,
                    onPressed: () => widget.onChangeCurve?.call(widget.previousCurve),
                  ),
                ),
                4.0.horizontalSpace,
                Expanded(
                  child: _ChangeCurveButton(
                    label: widget.nextCurve.name,
                    onPressed: () => widget.onChangeCurve?.call(widget.nextCurve),
                    textFirst: true,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class _ChangeCurveButton extends StatelessWidget {
  const _ChangeCurveButton({
    required this.onPressed,
    required this.label,
    this.textFirst = false,
  });

  final bool textFirst;
  final Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textFirst ? TextDirection.rtl : TextDirection.ltr,
      child: TextButton.icon(
        onPressed: () => onPressed?.call(),
        icon: const Icon(Icons.arrow_left_rounded),
        label: Text(
          label.camelCaseToSpacedTitleCase,
          style: TextStyle(
            fontSize: 10,
            color: context.colorScheme.onBackground,
          ),
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.small,
            side: appBorderSide,
          ),
          alignment: textFirst ? Alignment.centerRight : Alignment.centerLeft,
          padding: [15.0, 5.0].verticalHorizontal,
        ),
      ),
    );
  }
}

class CurveDemonstrationChart extends StatelessWidget {
  const CurveDemonstrationChart({
    super.key,
    required this.animation,
    required this.verticalOffset,
  });

  final Animation animation;
  final double verticalOffset;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: _chartHeight,
          child: Text("x"),
        ),
        4.0.horizontalSpace,

        Column(
          children: [

            Stack(
              clipBehavior: Clip.none,
              children: [
                /// BASE GRAPH
                SizedBox(
                  width: _chartWidth,
                  height: _chartHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        left: appBorderSide.copyWith(width: 0.7),
                        bottom: appBorderSide.copyWith(width: 0.7),
                      ),
                    ),
                  ),
                ),

                /// ANIMATED DOT
                Positioned(
                  width: _dotSize,
                  height: _dotSize,
                  left: animation.value,
                  bottom: verticalOffset,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
            4.0.verticalSpace,

            const SizedBox(
              width: _chartWidth,
              child: Text("t", textAlign: TextAlign.end,),
            ),
          ],
        ),
      ],
    );
  }
}
