import 'dart:developer';

import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_x_rotation.dart';
import 'package:redux/redux.dart';

final updateXRotationReducer = TypedReducer<AppState, UpdateXRotation>(
  (state, action) {
    log("[updateXRotationReducer]");
    return state.copyWith(
      basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
        xRotation: action.rotation,
      ),
    );
  },
);
