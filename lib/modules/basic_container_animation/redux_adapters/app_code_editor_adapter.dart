import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';
import 'package:flutter_animations_studio/modules/app/app_state.dart';
import 'package:flutter_animations_studio/ui/theme.dart';
import 'package:flutter_animations_studio/ui/widgets/app_code_editor.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:highlight/languages/dart.dart';

class _ViewModel extends Equatable {
  const _ViewModel({required this.controller});

  final CodeController controller;

  @override
  List<Object?> get props => [
        controller,
      ];
}

class AppCodeEditorAdapter extends StatelessWidget {
  const AppCodeEditorAdapter({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) {
        final state = store.state.basicContainerAnimationState!;

        final List codeLines = [
          "import 'dart:math';",
          "",
          "import 'package:flutter/material.dart';",
          "",
          "class MyBasicAnimation extends StatefulWidget {",
          "\tconst MyBasicAnimation({super.key});",
          "",
          "\t@override",
          "\tState<MyBasicAnimation> createState() => _MyBasicAnimationState();"
              "\t}",
          "",
          "class _MyBasicAnimationState extends State<MyBasicAnimation>",
          "\twith TickerProviderStateMixin {",
          "",
          "\tlate Animation<double> animation;",
          "\tlate AnimationController animationController;",
          "\t",
          "\t@override",
          "\tvoid initState() {",
          "\t\tsuper.initState();",
          "\t",
          "\t\tanimationController = AnimationController(",
          "\t\t\tvsync: this,",
          "\t\t\tduration: const Duration(milliseconds: ${state.duration}),",
          "\t\t);",
          "\t\tanimationController.repeat(reverse: ${state.reverse});",
          "\t",
          "\t\tanimation = Tween<double>(begin: 0, end: 2 * pi)",
          "\t\t\t.chain(CurveTween(curve: Curves.${state.appCurve.name}))",
          "\t\t\t.animate(animationController);",
          "\t}",
          "\t",
          "\t@override",
          "\tvoid dispose() {",
          "\t\tanimationController.dispose();",
          "\t\tsuper.dispose();",
          "\t}",
          "\t",
          "\tMatrix4 _transform() {",
          "\t\tvar matrix4 = Matrix4.identity();",
          if (state.xRotation.rotate) "\t\tmatrix4.rotateX(animation.value);",
          if (state.yRotation.rotate) "\t\tmatrix4.rotateY(animation.value);",
          if (state.zRotation.rotate) "\t\tmatrix4.rotateZ(animation.value);",
          "\t\treturn matrix4;",
          "\t}",
          "\t",
          "\t@override",
          "\tWidget build(BuildContext context) {",
          "\t\treturn SizedBox(",
          "\t\t\twidth: 100,",
          "\t\t\theight: 100,",
          "\t\t\tchild: AnimatedBuilder(",
          "\t\t\t\tanimation: animationController,",
          "\t\t\t\tbuilder: (context, child) {",
          "\t\t\t\t\treturn Transform(",
          "\t\t\t\t\t\talignment: ${state.alignment},",
          "\t\t\t\t\t\ttransform: _transform(),",
          "\t\t\t\t\t\tchild: Container(",
          "\t\t\t\t\t\t\twidth: 100,",
          "\t\t\t\t\t\t\theight: 100,",
          "\t\t\t\t\t\t\tdecoration: const BoxDecoration(",
          "\t\t\t\t\t\t\t\tcolor: Colors.blueAccent,",
          "\t\t\t\t\t\t\tborderRadius: BorderRadius.all(Radius.circular(16.0)),",
          "\t\t\t\t\t\t\t),",
          "\t\t\t\t\t\t),",
          "\t\t\t\t\t);",
          "\t\t\t\t},",
          "\t\t\t)",
          "\t\t);",
          "\t} ",
          "} ",
        ];

        final CodeController controller = CodeController(
          language: dart,
          text: codeLines.join("\n"),
          analyzer: DartPadAnalyzer(),
          readOnly: true,
        );

        return _ViewModel(controller: controller);
      },
      builder: (context, vm) {
        return AppCodeEditor(
          codeField: CodeField(
            controller: vm.controller,
            padding: 24.0.all,
            textStyle: const TextStyle(fontSize:  14.0),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.large,
            ),
          ),
        );
      },
    );
  }
}