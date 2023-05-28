import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/models/app_curve.dart';
import 'package:flutter_animations_studio/models/rotation.dart';

class BasicContainerAnimationState extends Equatable {
  const BasicContainerAnimationState({
    required this.showOriginalPosition,
    required this.showAlignmentDot,
    required this.zRotation,
    required this.xRotation,
    required this.yRotation,
    required this.minDuration,
    required this.maxDuration,
    required this.duration,
    required this.reverse,
    required this.appCurve,
    required this.alignment,
  });

  factory BasicContainerAnimationState.initial() {
    return BasicContainerAnimationState(
      showOriginalPosition: true,
      showAlignmentDot: true,
      minDuration: 200,
      maxDuration: 5000,
      duration: 2000,
      xRotation: const Rotation(),
      yRotation: const Rotation(),
      zRotation: const Rotation(rotate: true),
      reverse: false,
      appCurve: AppCurves.linear.appCurve,
      alignment: Alignment.topRight,
    );
  }

  final int minDuration;
  final int maxDuration;
  final int duration;

  final bool showOriginalPosition;
  final bool showAlignmentDot;

  final Rotation zRotation;
  final Rotation xRotation;
  final Rotation yRotation;

  final bool reverse;

  final AppCurve appCurve;

  final Alignment alignment;

  BasicContainerAnimationState copyWith({
    bool? showOriginalPosition,
    bool? showAlignmentDot,
    Rotation? zRotation,
    Rotation? xRotation,
    Rotation? yRotation,
    int? minDuration,
    int? maxDuration,
    int? duration,
    bool? reverse,
    AppCurve? appCurve,
    Alignment? alignment,
  }) {
    return BasicContainerAnimationState(
      showOriginalPosition: showOriginalPosition ?? this.showOriginalPosition,
      showAlignmentDot: showAlignmentDot ?? this.showAlignmentDot,
      zRotation: zRotation ?? this.zRotation,
      xRotation: xRotation ?? this.xRotation,
      yRotation: yRotation ?? this.yRotation,
      minDuration: minDuration ?? this.minDuration,
      maxDuration: maxDuration ?? this.maxDuration,
      duration: duration ?? this.duration,
      reverse: reverse ?? this.reverse,
      appCurve: appCurve ?? this.appCurve,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  List<Object> get props => [
        showOriginalPosition,
        showAlignmentDot,
        zRotation,
        xRotation,
        yRotation,
        minDuration,
        maxDuration,
        duration,
        reverse,
        appCurve,
        alignment,
      ];
}
