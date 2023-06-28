import 'package:flutter_animations_studio/log.dart';
import 'package:flutter_animations_studio/models/app_curve.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:redux/redux.dart';

class UpdateCurve {
  const UpdateCurve({
    required this.appCurve,
  });

  final AppCurve appCurve;
}

final updateCurveReducer = TypedReducer<AppState, UpdateCurve>((state, action) {
    if (action.appCurve != state.basicContainerAnimationState!.appCurve) {
      Log.info("[updateCurveReducer]");
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