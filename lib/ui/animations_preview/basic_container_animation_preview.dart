import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';
import 'package:flutter_animations_studio/utils.dart';

class BasicContainerAnimationPreview extends StatefulWidget {
  const BasicContainerAnimationPreview({
    Key? key,
    required this.duration,
    required this.showOriginalPosition,
    required this.showAlignmentDot,
    this.rotateX = false,
    this.rotateY = false,
    this.rotateZ = true,
    this.reverse = false,
    this.curve = Curves.linear,
  }) : super(key: key);

  final int duration;
  final bool showOriginalPosition;
  final bool showAlignmentDot;

  final bool rotateX;
  final bool rotateY;
  final bool rotateZ;

  final bool reverse;

  final Curve curve;

  @override
  State<BasicContainerAnimationPreview> createState() =>
      _BasicContainerAnimationPreviewState();
}

class _BasicContainerAnimationPreviewState
    extends State<BasicContainerAnimationPreview>
    with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController animationController;

  Alignment alignment = Alignment.bottomLeft;

  @override
  void didUpdateWidget(covariant BasicContainerAnimationPreview oldWidget) {
    if (widget.curve != oldWidget.curve) {
      _resetAnimation();
    }
  }

  Animation<double> _createAnimation() {
    return Tween<double>(begin: 0, end: 2 * pi)
        .chain(CurveTween(curve: widget.curve))
        .animate(animationController);
  }

  _resetAnimation() {
    dev.log("[_resetAnimation]");
    animation = _createAnimation();
    animationController.reset();
    animationController.repeat(reverse: widget.reverse);
  }

  _resetController() {
    dev.log("[_BasicContainerAnimationPreviewState] _resetController");
    animationController.duration = widget.duration.milliseconds;
    animationController.repeat(reverse: widget.reverse);
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: widget.duration.milliseconds,
    )..repeat(reverse: widget.reverse);

    animation = _createAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  static const basePadding = 12.0;
  static const containerPadding = animatedContainerSize + basePadding;
  static const alignmentDotSize = animatedContainerSize / 10.0;

  Matrix4 _transform() {
    var matrix4 = Matrix4.identity();

    if (widget.rotateX) {
      matrix4.rotateX(animation.value);
    }

    if (widget.rotateY) {
      matrix4.rotateY(animation.value);
    }

    if (widget.rotateZ) {
      matrix4.rotateZ(animation.value);
    }

    return matrix4;
  }

  @override
  Widget build(BuildContext context) {
    _resetController();
    return SizedBox(
      height: animatedContainerSize * 3 + containerPadding,
      width: animatedContainerSize * 3 + containerPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [

              /// ORIGINAL POSITION - EMPTY CONTAINER
              if (widget.showOriginalPosition)
                Container(
                  width: animatedContainerSize,
                  height: animatedContainerSize,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                ),

              /// ANIMATED CONTAINER
              SizedBox(
                width: animatedContainerSize,
                height: animatedContainerSize,
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform(
                      alignment: alignment,
                      transform: _transform(),
                      child: Container(
                        width: animatedContainerSize,
                        height: animatedContainerSize,
                        decoration: BoxDecoration(
                          // TODO Change with a linear gradient
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),

              /// ALIGNMENT DOT
              if (widget.showAlignmentDot)
                Positioned(
                  width: animatedContainerSize,
                  height: animatedContainerSize,
                  top: alignment.isTop
                      ? (alignmentDotSize / 2.0) * alignment.vOffset
                      : null,
                  bottom: alignment.isBottom
                      ? -1.0 * (alignmentDotSize / 2.0) * alignment.vOffset
                      : null,
                  right: alignment.isRight
                      ? -1.0 * (alignmentDotSize / 2.0) * alignment.hOffset
                      : null,
                  left: alignment.isLeft
                      ? (alignmentDotSize / 2.0) * alignment.hOffset
                      : null,
                  child: AnimatedAlign(
                    duration: 500.milliseconds,
                    curve: Curves.easeOut,
                    alignment: alignment,
                    child: Container(
                      width: alignmentDotSize,
                      height: alignmentDotSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

extension on Alignment {
  /* Vertical */
  bool get isTop => y == -1.0;
  bool get isVerticalCenter => y == 0.0;
  bool get isBottom => y == 1.0;

  /* Horizontal */
  bool get isLeft => x == -1.0;
  bool get isHorizontalCenter => x == 0.0;
  bool get isRight => x == 1.0;

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
}
