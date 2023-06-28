import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux_components/update_show_alignment_dot.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ShowAlignmentDotCheckboxAdapter extends StatelessWidget {
  const ShowAlignmentDotCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    onChanged(newValue) {
      store.dispatch(
        UpdateShowAlignmentDot(
          showAlignmentDot: newValue,
        ),
      );
    }

    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Show alignment dot",
          value: store.state.basicContainerAnimationState!.showAlignmentDot,
          onChanged: onChanged,
        );
      },
    );
  }
}
