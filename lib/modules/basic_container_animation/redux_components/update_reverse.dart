import 'package:flutter_animations_studio/log.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:redux/redux.dart';

class UpdateReverse {
  UpdateReverse({required this.reverse});
  final bool reverse;
}

final updateReverseReducer = TypedReducer<AppState, UpdateReverse>((state, action) {
    if (action.reverse != state.basicContainerAnimationState!.reverse) {
      Log.info("[updateReverseReducer]");
      return state.copyWith(
        basicContainerAnimationState:
            state.basicContainerAnimationState!.copyWith(
          reverse: action.reverse,
        ),
      );
    }
    return state;
  },
);