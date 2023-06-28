import 'package:flutter_animations_studio/log.dart';
import 'package:flutter_animations_studio/modules/common/actions/update_rotation.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:redux/redux.dart';

class UpdateZRotation extends UpdateRotation {
  UpdateZRotation({required super.rotation});
}

final updateZRotationReducer = TypedReducer<AppState, UpdateZRotation>((state, action) {
  if (state.basicContainerAnimationState!.zRotation != action.rotation) {
    Log.info("[updateZRotationReducer]");
    return state.copyWith(
      basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
        zRotation: action.rotation,
      ),
    );
  }
  return state;
});