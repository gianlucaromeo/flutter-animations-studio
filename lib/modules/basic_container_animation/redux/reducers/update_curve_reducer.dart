import 'dart:developer';

import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_curve.dart';
import 'package:redux/redux.dart';

final updateCurveReducer = TypedReducer<AppState, UpdateCurve>(
  (state, action) {
    if (action.appCurve != state.basicContainerAnimationState!.appCurve) {
      log("[updateCurveReducer]");
      return state.copyWith(
        basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
            appCurve: action.appCurve,
          ),
      );
    }
    return state;
  },
);
