import 'package:equatable/equatable.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:redux/redux.dart';

class AppStore extends Store<AppState> with EquatableMixin {
  AppStore(
    super.reducer, {
    required super.initialState,
  });

  // TODO Check if needed
  @override
  List<Object> get props => [
    super.reducer,
    super.state,
  ];
}
