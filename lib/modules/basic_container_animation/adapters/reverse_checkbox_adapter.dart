import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_reverse.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';

class ReverseCheckboxAdapter extends StatelessWidget {
  const ReverseCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Reverse",
          value: store.state.basicContainerAnimationState!.reverse,
          onChanged: (newValue) {
            store.dispatch(
              UpdateReverse(
                reverse: newValue,
              ),
            );
          },
        );
      },
    );
  }
}
