import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/log.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/ui/widgets/app_checkbox.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CheckboxViewModel extends Equatable {
  const CheckboxViewModel({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final Function(bool) onChanged;

  @override
  List<Object> get props => [
        label,
        value,
        onChanged,
      ];
}

class CheckboxAdapter extends StatelessWidget {
  const CheckboxAdapter({
    Key? key,
    required this.converter,
  }) : super(key: key);

  final StoreConverter<AppState, CheckboxViewModel> converter;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckboxViewModel>(
      distinct: true,
      onDidChange: (previousViewModel, viewModel) {
        Log.info("[DidChange] CheckboxAdapter");
      },
      converter: converter,
      builder: (context, vm) {
        return AppCheckbox(
          label: vm.label,
          initialValue: vm.value,
          onChanged: vm.onChanged,
        );
      },
    );
  }
}