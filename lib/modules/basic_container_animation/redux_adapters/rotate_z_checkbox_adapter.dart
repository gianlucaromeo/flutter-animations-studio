import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux_components/update_z_rotation.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';
import 'package:flutter_redux/flutter_redux.dart';

class RotateZCheckboxAdapter extends StatelessWidget {
  const RotateZCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    onChanged(newValue) {
      store.dispatch(
        UpdateZRotation(
          rotation: store.state.basicContainerAnimationState!.zRotation
              .copyWith(rotate: newValue),
        ),
      );
    }

    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Rotate z axis",
          value: store.state.basicContainerAnimationState!.zRotation.rotate,
          onChanged: onChanged,
        );
      },
    );
  }
}
