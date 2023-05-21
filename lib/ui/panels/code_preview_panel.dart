import 'package:flutter/material.dart';

class CodePreviewPanel extends StatelessWidget {
  const CodePreviewPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: const Border(
          left: BorderSide(
            color: Colors.white,
            width: 0.3,
          ),
        ),
      ),
    );
  }
}
