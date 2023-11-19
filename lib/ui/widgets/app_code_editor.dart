import 'package:flutter/material.dart';

import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';

class AppCodeEditor extends StatelessWidget {
  const AppCodeEditor({
    super.key,
    required this.codeField,
  });

  final CodeField codeField;

  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: CodeThemeData(
         styles: androidstudioTheme,
      ),
      child: SingleChildScrollView(child: codeField),
    );
  }
}
