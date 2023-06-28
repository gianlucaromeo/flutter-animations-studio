import 'package:flutter_animations_studio/log.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:redux/redux.dart';

class UpdateAnimationDuration {
  const UpdateAnimationDuration({
    required this.duration,
  });

  final int duration;
}

final updateAnimationDurationReducer = TypedReducer<AppState, UpdateAnimationDuration>((state, action) {
  if (state.basicContainerAnimationState!.duration != action.duration) {
    Log.info("[updateDurationReducer]");
    return state.copyWith(
      basicContainerAnimationState: state.basicContainerAnimationState?.copyWith(
        duration: action.duration,
      ),
    );
  }
  return state;
});