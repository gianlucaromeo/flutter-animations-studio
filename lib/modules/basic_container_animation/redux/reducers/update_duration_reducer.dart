import 'dart:developer';

import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_animation_duration.dart';
import 'package:redux/redux.dart';


final updateDurationReducer =
    TypedReducer<AppState, UpdateAnimationDuration>(
  (state, action) {
    log("[updateDurationReducer]");

    return state.copyWith(
      basicContainerAnimationState: state.basicContainerAnimationState?.copyWith(
        duration: action.duration,
      )
    );
  },
);
