import 'package:equatable/equatable.dart';
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
  });

  factory BasicContainerAnimationState.initial() {
    return const BasicContainerAnimationState(
      showOriginalPosition: false,
      showAlignmentDot: false,
      minDuration: 200,
      maxDuration: 5000,
      duration: 2000,
      xRotation: Rotation(),
      yRotation: Rotation(),
      zRotation: Rotation(rotate: true),
      reverse: false,
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
      ];
}
