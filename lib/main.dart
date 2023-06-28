import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/app/app_store.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/basic_container_animation.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/basic_container_animation_page.dart';
import 'package:flutter_animations_studio/ui/theme.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = AppStore(
    combineReducers<AppState>([
      updateAnimationDurationReducer,
      updateShowOriginalPositionReducer,
      updateShowAlignmentDotReducer,
      updateXRotationReducer,
      updateYRotationReducer,
      updateZRotationReducer,
      updateReverseReducer,
      updateCurveReducer,
      updateAlignmentReducer,
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
