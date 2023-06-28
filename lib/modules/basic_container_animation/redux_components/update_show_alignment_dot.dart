import 'package:flutter_animations_studio/log.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class UpdateShowAlignmentDot {
  const UpdateShowAlignmentDot({
    required this.showAlignmentDot,
  });

  final bool showAlignmentDot;
}

final updateShowAlignmentDotReducer = TypedReducer<AppState, UpdateShowAlignmentDot>((state, action) {
  if (state.basicContainerAnimationState!.showAlignmentDot != action.showAlignmentDot) {
    Log.info("[updateShowAlignmentDotReducer]");
    return state.copyWith(
      basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
        showAlignmentDot: action.showAlignmentDot,
      ),
    );
  }
  return state;
});