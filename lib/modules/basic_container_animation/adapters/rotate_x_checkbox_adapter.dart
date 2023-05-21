import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_x_rotation.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';

class RotateXCheckboxAdapter extends StatelessWidget {
  const RotateXCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Rotate x axis",
          value: store.state.basicContainerAnimationState!.xRotation.rotate,
          onChanged: (newValue) {
            store.dispatch(
              UpdateXRotation(
                rotation: store.state.basicContainerAnimationState!.xRotation
                    .copyWith(rotate: newValue),
              ),
            );
          },
        );
      },
    );
  }
}
