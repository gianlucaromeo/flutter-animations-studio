import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/ui/panels/animation_preview_panel.dart';
import 'package:flutter_animations_studio/ui/panels/code_preview_panel.dart';
import 'package:flutter_animations_studio/ui/panels/configuration_panel.dart';
import 'package:flutter_animations_studio/ui/panels/controller_panel.dart';

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
  final ConfigurationPanel configurationPanel; // Left Panel
  final AnimationPreviewPanel animationPreviewPanel; // Center (Top) Panel
  final ControllerPanel controllerPanel; // Center (Bottom) Panel
  final CodePreviewPanel codePreviewPanel; // Right Panel

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
