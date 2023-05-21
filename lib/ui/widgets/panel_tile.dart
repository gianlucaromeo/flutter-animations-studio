import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/ui/theme.dart';

class PanelTile extends StatelessWidget {
  const PanelTile({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: appBorderSide,
        ),
      ),
      child: child,
    );
  }
}
