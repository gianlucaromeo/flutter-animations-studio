import 'package:flutter_animations_studio/log.dart';
import 'package:flutter_animations_studio/modules/common/actions/update_rotation.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:redux/redux.dart';

class UpdateYRotation extends UpdateRotation {
  UpdateYRotation({required super.rotation});
}

final updateYRotationReducer = TypedReducer<AppState, UpdateYRotation>((state, action) {
    if (state.basicContainerAnimationState!.yRotation != action.rotation) {
      Log.info("[updateYRotationReducer]");
      return state.copyWith(
        basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
            yRotation: action.rotation,
          ),
      );
    }
    return state;
  },
);