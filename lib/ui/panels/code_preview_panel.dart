import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';
import 'package:flutter_animations_studio/ui/theme.dart';

class CodePreviewPanel extends StatelessWidget {
  const CodePreviewPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppBorderRadius.large,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning_amber),
          12.0.verticalSpace,
          const Text(
            "Work in progress",
          ),
          12.0.verticalSpace,
          const Text(
            "This panel will contain the Dart code of the animation",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
