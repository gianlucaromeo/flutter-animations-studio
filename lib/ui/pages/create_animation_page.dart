import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';
import 'package:flutter_animations_studio/ui/panels/animation_preview_panel.dart';
import 'package:flutter_animations_studio/ui/panels/code_preview_panel.dart';
import 'package:flutter_animations_studio/ui/panels/configuration_panel.dart';
import 'package:flutter_animations_studio/ui/panels/controller_panel.dart';

class CreateAnimationPage extends StatefulWidget {
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
  final CodePreviewPanel codePreviewPanel;  // Right Panel

  @override
  State<CreateAnimationPage> createState() => _CreateAnimationPageState();
}

class _CreateAnimationPageState extends State<CreateAnimationPage> {
  final minWidth = 1450.0;
  final minHeight = 850.0;

  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  Scaffold _buildScaffold() {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: 25.0.all,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            widget.configurationPanel,
            25.0.horizontalSpace,
            Flexible(
              flex: 0,
              child: Column(
                children: [
                  Expanded(flex: 2, child: widget.animationPreviewPanel),
                  Expanded(child: widget.controllerPanel),
                ],
              ),
            ),
            25.0.horizontalSpace,
            Expanded(child: widget.codePreviewPanel),
          ],
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final scaffold = _buildScaffold();

    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalScrollbarEnabled = constraints.minWidth < minWidth;
        final verticalScrollbarEnabled = constraints.minHeight < minHeight;

        if (horizontalScrollbarEnabled && verticalScrollbarEnabled) {
          return Scrollbar(
            controller: _horizontalController,
            child: Scrollbar(
              // IMPORTANT: this scrollbar only handle notification of the vertical ScrollView.
              // The first ScrollView (depth = 0), is the horizontal one.
              // The second ScrollView (depth = 1), is the vertical one.
              // If notification.depth != 1, the notification is bubble up to horizontal Scrollbar.
              notificationPredicate: (notification) => notification.depth == 1,
              controller: _verticalController,
              child: SingleChildScrollView(
                controller: _horizontalController,
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  controller: _verticalController,
                  child: SizedBox(
                    width: minWidth,
                    height: minHeight,
                    child: scaffold,
                  ),
                ),
              ),
            ),
          );
        } else if (horizontalScrollbarEnabled) {
          return Scrollbar(
            controller: _horizontalController,
            child: SingleChildScrollView(
              controller: _horizontalController,
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: minWidth,
                child: scaffold,
              ),
            ),
          );
        } else if (verticalScrollbarEnabled) {
          return Scrollbar(
            controller: _verticalController,
            child: SingleChildScrollView(
              controller: _verticalController,
              child: SizedBox(
                height: minHeight,
                child: scaffold,
              ),
            ),
          );
        }

        return scaffold;
      },
    );
  }
}
