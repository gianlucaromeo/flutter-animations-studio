import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/models/app_curve.dart';
import 'package:flutter_animations_studio/ui/animations_preview/basic_container_animation_preview.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_animations_studio/modules/app/app_state.dart';

class _ViewModel extends Equatable {
  const _ViewModel({
    required this.duration,
    required this.showOriginalPosition,
    required this.showAlignmentDot,
    required this.rotateX,
    required this.rotateY,
    required this.rotateZ,
    required this.reverse,
    required this.appCurve,
    required this.alignment,
  });

  final int duration;
  final bool showOriginalPosition;
  final bool showAlignmentDot;

  final bool rotateX;
  final bool rotateY;
  final bool rotateZ;

  final bool reverse;

  final AppCurve appCurve;

  final Alignment alignment;

  @override
  List<Object> get props => [
        duration,
        showOriginalPosition,
        showAlignmentDot,
        rotateX,
        rotateY,
        rotateZ,
        reverse,
        appCurve,
        alignment,
      ];
}

class BasicContainerAnimationPreviewAdapter extends StatelessWidget {
  const BasicContainerAnimationPreviewAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel(
        duration: store.state.basicContainerAnimationState!.duration,
        showOriginalPosition:
            store.state.basicContainerAnimationState!.showOriginalPosition,
        showAlignmentDot:
            store.state.basicContainerAnimationState!.showAlignmentDot,
        rotateX: store.state.basicContainerAnimationState!.xRotation.rotate,
        rotateY: store.state.basicContainerAnimationState!.yRotation.rotate,
        rotateZ: store.state.basicContainerAnimationState!.zRotation.rotate,
        reverse: store.state.basicContainerAnimationState!.reverse,
        appCurve: store.state.basicContainerAnimationState!.appCurve,
        alignment: store.state.basicContainerAnimationState!.alignment,
      ),
      builder: (context, vm) {
        return BasicContainerAnimationPreview(
          duration: vm.duration,
          showOriginalPosition: vm.showOriginalPosition,
          showAlignmentDot: vm.showAlignmentDot,
          rotateX: vm.rotateX,
          rotateY: vm.rotateY,
          rotateZ: vm.rotateZ,
          reverse: vm.reverse,
          curve: vm.appCurve.curve,
          alignment: vm.alignment,
        );
      },
    );
  }
}
