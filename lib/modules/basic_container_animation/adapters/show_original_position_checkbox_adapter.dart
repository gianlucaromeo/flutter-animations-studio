import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_show_original_position.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';

class ShowOriginalPositionCheckboxAdapter extends StatelessWidget {
  const ShowOriginalPositionCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Show original position",
          value: store.state.basicContainerAnimationState!.showOriginalPosition,
          onChanged: (newValue) {
            store.dispatch(
              UpdateShowOriginalPosition(
                showOriginalPosition: newValue,
              ),
            );
          },
        );
      },
    );
  }
}
