import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux_components/update_x_rotation.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';
import 'package:flutter_redux/flutter_redux.dart';

class RotateXCheckboxAdapter extends StatelessWidget {
  const RotateXCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    onChanged(newValue) {
      store.dispatch(
        UpdateXRotation(
          rotation: store.state.basicContainerAnimationState!.xRotation
              .copyWith(rotate: newValue),
        ),
      );
    }

    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Rotate x axis",
          value: store.state.basicContainerAnimationState!.xRotation.rotate,
          onChanged: onChanged,
        );
      },
    );
  }
}
