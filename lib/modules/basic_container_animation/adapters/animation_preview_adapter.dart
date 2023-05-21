import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/ui/animations_preview/basic_container_animation_preview.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_animations_studio/modules/app/redux/states/app_state.dart';

class _ViewModel extends Equatable {
  const _ViewModel({
    required this.duration,
    required this.showOriginalPosition,
    required this.showAlignmentDot,
    required this.rotateX,
    required this.rotateY,
    required this.rotateZ,
    required this.reverse,
  });

  final int duration;
  final bool showOriginalPosition;
  final bool showAlignmentDot;

  final bool rotateX;
  final bool rotateY;
  final bool rotateZ;

  final bool reverse;

  @override
  List<Object> get props => [
        duration,
        showOriginalPosition,
        showAlignmentDot,
        rotateX,
        rotateY,
        rotateZ,
        reverse,
      ];
}

class BasicContainerAnimationPreviewAdapter extends StatelessWidget {
  const BasicContainerAnimationPreviewAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      onDidChange: (previousViewModel, viewModel) {
        log("[DidChange] BasicContainerAnimationPreviewAdapter");
      },
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
        );
      },
    );
  }
}
