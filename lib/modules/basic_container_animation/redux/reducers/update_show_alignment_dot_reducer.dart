import 'dart:developer';

import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

import '../actions/update_show_alignment_dot.dart';

final updateShowAlignmentDotReducer =
    TypedReducer<AppState, UpdateShowAlignmentDot>(
  (state, action) {
    log("[updateShowAlignmentDotReducer]");
    return state.copyWith(
      basicContainerAnimationState:
          state.basicContainerAnimationState!.copyWith(
            showAlignmentDot: action.showAlignmentDot,
      ),
    );
  },
);
