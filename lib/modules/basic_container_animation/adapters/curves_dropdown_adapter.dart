import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/models/app_curve.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_curve.dart';
import 'package:flutter_animations_studio/ui/widgets/app_dropdown.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel extends Equatable {
  const _ViewModel({
    required this.options,
    required this.currentOption,
    this.onChanged,
  });

  final List<String> options;
  final String currentOption;
  final void Function(String?)? onChanged;

  @override
  List<Object?> get props => [
    options,
    currentOption,
    onChanged,
  ];
}

class CurvesDropdownAdapter extends StatelessWidget {
  const CurvesDropdownAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onChanged(curveDescription) {
      if (curveDescription != null) {
        final selectedCurve = AppCurves.values.byName(curveDescription).appCurve;
        StoreProvider.of<AppState>(context).dispatch(
          UpdateCurve(
            appCurve: selectedCurve,
          ),
        );
      }
    }

    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel(
        options: AppCurves.values.map((curve) => curve.name).toList(),
        currentOption: store.state.basicContainerAnimationState!.appCurve.name,
        onChanged: onChanged,
      ),
      builder: (context, vm) {
        return AppDropdown(
          options: vm.options,
          currentOption: vm.currentOption,
          onChanged: vm.onChanged,
        );
      },
    );
  }
}
