import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_z_rotation.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';

class RotateZCheckboxAdapter extends StatelessWidget {
  const RotateZCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Rotate z axis",
          value: store.state.basicContainerAnimationState!.zRotation.rotate,
          onChanged: (newValue) {
            store.dispatch(
              UpdateZRotation(
                rotation: store.state.basicContainerAnimationState!.zRotation
                    .copyWith(rotate: newValue),
              ),
            );
          },
        );
      },
    );
  }
}
