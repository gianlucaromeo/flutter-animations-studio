import 'dart:developer';

import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_reverse.dart';
import 'package:redux/redux.dart';

final updateReverseReducer = TypedReducer<AppState, UpdateReverse>(
  (state, action) {
    log("[updateReverseReducer]");
    return state.copyWith(
      basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
        reverse: action.reverse,
      ),
    );
  },
);
