import 'package:flutter_animations_studio/modules/basic_container_animation/basic_container_animation_state.dart';

class AppState {
  final BasicContainerAnimationState? basicContainerAnimationState;

  const AppState({
    this.basicContainerAnimationState,
  });

  factory AppState.initial() {
    return AppState(
      basicContainerAnimationState: BasicContainerAnimationState.initial(),
    );
  }

  AppState copyWith({
    BasicContainerAnimationState? basicContainerAnimationState,
  }) {
    return AppState(
      basicContainerAnimationState:
          basicContainerAnimationState ?? this.basicContainerAnimationState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          basicContainerAnimationState == other.basicContainerAnimationState;

  @override
  int get hashCode => basicContainerAnimationState.hashCode;
}