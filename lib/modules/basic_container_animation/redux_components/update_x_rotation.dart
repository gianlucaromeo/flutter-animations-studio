import 'package:flutter_animations_studio/log.dart';
import 'package:flutter_animations_studio/modules/common/actions/update_rotation.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class UpdateXRotation extends UpdateRotation {
  UpdateXRotation({required super.rotation});
}

final updateXRotationReducer = TypedReducer<AppState, UpdateXRotation>((state, action) {
    if (state.basicContainerAnimationState!.xRotation != action.rotation) {
      Log.info("[updateXRotationReducer]");
      return state.copyWith(
        basicContainerAnimationState:
        state.basicContainerAnimationState!.copyWith(
          xRotation: action.rotation,
        ),
      );
    }
    return state;
  },
);