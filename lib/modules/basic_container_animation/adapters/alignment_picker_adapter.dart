import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_alignment.dart';
import 'package:flutter_animations_studio/ui/widgets/alignment_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel extends Equatable {
  const _ViewModel({
    required this.alignment,
    required this.onTap,
  });

  final Alignment alignment;
  final Function(Alignment) onTap;

  @override
  List<Object> get props => [
    alignment,
    onTap,
  ];
}

class AlignmentPickerAdapter extends StatelessWidget {
  const AlignmentPickerAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    onTap(newAlignment) {
      store.dispatch(
        UpdateAlignment(alignment: newAlignment),
      );
    }

    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) {
        return _ViewModel(
          alignment: store.state.basicContainerAnimationState!.alignment,
          onTap: onTap,
        );
      },
      builder: (context, vm) {
        return AlignmentPicker(
          currentAlignment: vm.alignment,
          onAlignmentTap: vm.onTap,
        );
      },
    );
  }
}
