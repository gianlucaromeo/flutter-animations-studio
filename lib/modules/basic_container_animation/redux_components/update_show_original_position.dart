import 'package:flutter_animations_studio/log.dart';
import 'package:redux/redux.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';

class UpdateShowOriginalPosition {
  const UpdateShowOriginalPosition({
    required this.showOriginalPosition,
  });

  final bool showOriginalPosition;
}

final updateShowOriginalPositionReducer = TypedReducer<AppState, UpdateShowOriginalPosition>((state, action) {
  Log.info("[updateShowOriginalPositionReducer]");
  if (state.basicContainerAnimationState!.showOriginalPosition != action.showOriginalPosition) {
    return state.copyWith(
      basicContainerAnimationState:
        state.basicContainerAnimationState!.copyWith(
          showOriginalPosition: action.showOriginalPosition,
        ),
    );
  }
  return state;
});