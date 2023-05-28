import 'dart:developer';

import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_alignment.dart';
import 'package:redux/redux.dart';

final updateAlignmentReducer = TypedReducer<AppState, UpdateAlignment>(
  (state, action) {
    if (action.alignment != state.basicContainerAnimationState!.alignment) {
      log("[updateAlignmentReducer]");
      return state.copyWith(
        basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
            alignment: action.alignment,
          ),
      );
    }
    return state;
  },
);
