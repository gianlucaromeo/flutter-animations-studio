import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/models/app_curve.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_curve.dart';
import 'package:flutter_animations_studio/ui/animations_preview/curve_preview.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel extends Equatable {
  const _ViewModel({
    required this.currentCurve,
    required this.previousCurve,
    required this.nextCurve,
    required this.onChangeCurve,
  });

  final AppCurve currentCurve;
  final AppCurve previousCurve;
  final AppCurve nextCurve;
  final Function(AppCurve) onChangeCurve;

  @override
  List<Object> get props => [
    currentCurve,
    previousCurve,
    nextCurve,
    onChangeCurve,
  ];
}

class CurvePreviewAdapter extends StatelessWidget {
  const CurvePreviewAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    updateAppCurve(AppCurve appCurve) {
      store.dispatch(
        UpdateCurve(appCurve: appCurve),
      );
    }
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) {
        final currentCurve = store.state.basicContainerAnimationState!.appCurve;
        return _ViewModel(
          currentCurve: currentCurve,
          previousCurve: currentCurve.previous,
          nextCurve: currentCurve.next,
          onChangeCurve: updateAppCurve,
        );
      },
      builder: (context, vm) {
       return CurvePreview(
          currentCurve: vm.currentCurve,
          previousCurve: vm.previousCurve,
          nextCurve: vm.nextCurve,
          onChangeCurve: vm.onChangeCurve,
        );
      },
    );
  }
}
