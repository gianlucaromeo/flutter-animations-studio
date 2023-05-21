import 'package:flutter/material.dart';

class CreateAnimationPage extends StatelessWidget {
  const CreateAnimationPage({
    Key? key,
    required this.title,
    required this.configurationPanel,
    required this.animationPreviewPanel,
    required this.controllerPanel,
    required this.codePreviewPanel,
  }) : super(key: key);

  final String title;
  final Widget configurationPanel; // Left Panel
  final Widget animationPreviewPanel; // Center (Top) Panel
  final Widget controllerPanel; // Center (Bottom) Panel
  final Widget codePreviewPanel; // Right Panel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          configurationPanel,
          Flexible(
            flex: 0,
            child: Column(
              children: [
                Expanded(flex: 2, child: animationPreviewPanel),
                Expanded(child: controllerPanel),
              ],
            ),
          ),
          Expanded(child: codePreviewPanel),
        ],
      ),
    );
  }
}
