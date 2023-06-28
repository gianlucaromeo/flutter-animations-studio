import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/log.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:redux/redux.dart';

class UpdateAlignment {
  const UpdateAlignment({
    required this.alignment,
  });

  final Alignment alignment;
}

final updateAlignmentReducer = TypedReducer<AppState, UpdateAlignment>(
      (state, action) {
    if (action.alignment != state.basicContainerAnimationState!.alignment) {
      Log.info("[updateAlignmentReducer]");
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