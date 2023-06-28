import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux_components/update_reverse.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ReverseCheckboxAdapter extends StatelessWidget {
  const ReverseCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    onChanged(newValue) {
      store.dispatch(
        UpdateReverse(
          reverse: newValue,
        ),
      );
    }

    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Reverse",
          value: store.state.basicContainerAnimationState!.reverse,
          onChanged: onChanged,
        );
      },
    );
  }
}
