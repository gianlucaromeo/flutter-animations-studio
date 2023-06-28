import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/redux_components/update_show_original_position.dart';
import 'package:flutter_animations_studio/modules/common/adapters/checkbox_adapter.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ShowOriginalPositionCheckboxAdapter extends StatelessWidget {
  const ShowOriginalPositionCheckboxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    onChanged(newValue) {
      store.dispatch(
        UpdateShowOriginalPosition(
          showOriginalPosition: newValue,
        ),
      );
    }

    return CheckboxAdapter(
      converter: (store) {
        return CheckboxViewModel(
          label: "Show original position",
          value: store.state.basicContainerAnimationState!.showOriginalPosition,
          onChanged: onChanged,
        );
      },
    );
  }
}
