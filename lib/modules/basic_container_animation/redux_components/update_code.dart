import 'package:flutter_animations_studio/log.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:redux/redux.dart';

final updateCodeReducer = TypedReducer<AppState, dynamic>(
  (state, action) {
    Log.info("[updateCodeReducer]");
    return state.copyWith(
      basicContainerAnimationState: state.basicContainerAnimationState,
    );
  },
);
