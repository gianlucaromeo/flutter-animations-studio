import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';
import 'package:flutter_animations_studio/models/app_curve.dart';
import 'package:flutter_animations_studio/ui/theme.dart';

const double _dotSize = 8.0;
const double _baseChartWidth = 170.0; // (without considering the dot size)
const double _chartWidth = _baseChartWidth + _dotSize;
const double _baseChartHeight = 40.0; // (without considering the dot size)
const double _chartHeight = _baseChartHeight + _dotSize;

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
          _CurveDemonstrationChart(
            animation: animation,
            verticalOffset: verticalOffset,
            curve: widget.currentCurve.curve,
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

class _CurveDemonstrationChart extends StatelessWidget {
  const _CurveDemonstrationChart({
    required this.animation,
    required this.verticalOffset,
    required this.curve,
  });

  final Animation animation;
  final double verticalOffset;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(
      width: 1.7,
      color: context.colorScheme.secondary,
    );

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
                /// CURVE PAINTER
                Positioned(
                  width: _chartWidth,
                  height: _chartHeight,
                  top: _chartHeight,
                  child: RepaintBoundary(
                    child: CustomPaint(
                      painter: _CurvePainter(
                        curve: curve,
                        color: context.colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),

                /// BASE CHART
                SizedBox(
                  width: _chartWidth,
                  height: _chartHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        left: borderSide,
                        bottom: borderSide,
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

class _CurvePainter extends CustomPainter {
  _CurvePainter({
    required this.curve,
    required this.color,
  });

  final Curve curve;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;
    const circleSize = 1.0;
    var y = 0.0;
    for (double x = 0.0; x < _baseChartWidth; x++) {
      y = -1 * (curve.transform(x / _baseChartWidth) * _baseChartHeight) - 2;
      canvas.drawCircle(Offset(x + 0.5, y), circleSize, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return (oldDelegate as _CurvePainter).curve != curve;
  }
}