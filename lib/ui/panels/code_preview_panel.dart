import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/ui/theme.dart';

class CodePreviewPanel extends StatelessWidget {
  const CodePreviewPanel({
    Key? key,
    required this.appCodeEditor,
  }) : super(key: key);

  final Widget appCodeEditor;

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: appCodeEditor),
        ],
      ),
    );
  }
}
