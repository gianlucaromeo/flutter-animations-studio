import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_y_rotation.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';
import 'package:flutter_redux/flutter_redux.dart';

class RotateYCheckboxAdapter extends StatelessWidget {
  const RotateYCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    onChanged(newValue) {
      store.dispatch(
        UpdateYRotation(
          rotation: store.state.basicContainerAnimationState!.yRotation
              .copyWith(rotate: newValue),
        ),
      );
    }

    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Rotate y axis",
          value: store.state.basicContainerAnimationState!.yRotation.rotate,
          onChanged: onChanged,
        );
      },
    );
  }
}
