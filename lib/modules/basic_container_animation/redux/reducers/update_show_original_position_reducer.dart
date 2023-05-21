import 'dart:developer';

import 'package:redux/redux.dart';

import '../actions/update_show_original_position.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';

final updateShowOriginalPositionReducer =
    TypedReducer<AppState, UpdateShowOriginalPosition>(
  (state, action) {
    log("[updateShowOriginalPositionReducer] ${action.showOriginalPosition}");
    return state.copyWith(
      basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
        showOriginalPosition: action.showOriginalPosition,
      ),
    );
  },
);
