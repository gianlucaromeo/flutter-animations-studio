import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';

class AnimationPreviewPanel extends StatelessWidget {
  const AnimationPreviewPanel({
    Key? key,
    required this.previewOptions,
    required this.animationPreview,
  }) : super(key: key);

  final List<Widget> previewOptions;
  final Widget animationPreview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.0.all,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: previewOptions,
            ),
            //const Spacer(),
            animationPreview,
            //const Spacer(),
          ],
        ),
      ),
    );
  }
}
