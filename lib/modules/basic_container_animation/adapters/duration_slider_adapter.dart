import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_animation_duration.dart';
import 'package:flutter_animations_studio/ui/widgets/app_slider.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';

class _ViewModel extends Equatable {
  const _ViewModel({
    required this.min,
    required this.max,
    required this.currentValue,
    required this.appSliderShowType,
    required this.onChanged,
  });

  final double min;
  final double max;
  final double currentValue;
  final AppSliderShowType appSliderShowType;
  final Function(double) onChanged;

  @override
  List<Object> get props => [
        min,
        max,
        currentValue,
        appSliderShowType,
        onChanged,
      ];
}

class DurationSliderAdapter extends StatelessWidget {
  const DurationSliderAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    onChanged(newValue) {
      store.dispatch(
        UpdateAnimationDuration(
          duration: newValue.toInt(),
        ),
      );
    }

    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) {
        final state = store.state.basicContainerAnimationState!;
        return _ViewModel(
          min: state.minDuration.toDouble(),
          max: state.maxDuration.toDouble(),
          currentValue: state.duration.toDouble(),
          appSliderShowType: AppSliderShowType.all,
          onChanged: onChanged,
        );
      },
      builder: (context, vm) {
        return AppSlider(
          min: vm.min,
          max: vm.max,
          currentValue: vm.currentValue,
          onChanged: vm.onChanged,
          appSliderShowType: AppSliderShowType.all,
          valueType: "ms",
        );
      },
    );
  }
}
