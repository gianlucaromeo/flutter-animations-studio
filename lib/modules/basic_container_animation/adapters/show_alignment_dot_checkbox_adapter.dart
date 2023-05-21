import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux/actions/update_show_alignment_dot.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';

class ShowAlignmentDotCheckboxAdapter extends StatelessWidget {
  const ShowAlignmentDotCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Show alignment dot",
          value: store.state.basicContainerAnimationState!.showAlignmentDot,
          onChanged: (newValue) {
            store.dispatch(
              UpdateShowAlignmentDot(
                showAlignmentDot: newValue,
              ),
            );
          },
        );
      },
    );
  }
}
