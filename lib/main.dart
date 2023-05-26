import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/app/app_store.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/reducers/update_curve_reducer.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/reducers/update_duration_reducer.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/reducers/update_reverse_reducer.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/reducers/update_x_rotation_reducer.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/reducers/update_y_rotation_reducer.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/reducers/update_z_rotation_reducer.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/reducers/update_show_alignment_dot_reducer.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/reducers/update_show_original_position_reducer.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/basic_container_animation_page.dart';
import 'package:flutter_animations_studio/ui/theme.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = AppStore(
    combineReducers<AppState>([
      updateDurationReducer,
      updateShowOriginalPositionReducer,
      updateShowAlignmentDotReducer,
      updateXRotationReducer,
      updateYRotationReducer,
      updateZRotationReducer,
      updateReverseReducer,
      updateCurveReducer,
    ]),
    initialState: AppState.initial(),
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.store,
  });

  final AppStore store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Animations Studio',
        theme: appThemeData,
        home: const BasicContainerAnimationPage(),
      ),
    );
  }
}
