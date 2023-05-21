import 'dart:developer';

import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_y_rotation.dart';
import 'package:redux/redux.dart';

final updateYRotationReducer =
    TypedReducer<AppState, UpdateYRotation>(
  (state, action) {
    log("[updateYRotationReducer]");
    return state.copyWith(
      basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
            yRotation: action.rotation,
      ),
    );
  },
);
