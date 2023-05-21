import 'dart:developer';

import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_z_rotation.dart';
import 'package:redux/redux.dart';

final updateZRotationReducer =
    TypedReducer<AppState, UpdateZRotation>(
  (state, action) {
    log("[updateZRotationReducer]");
    return state.copyWith(
      basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
            zRotation: action.rotation,
      ),
    );
  },
);
