import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/ui/theme.dart';

import '../widgets/panel_tile.dart';

class ControllerPanel extends StatelessWidget {
  const ControllerPanel({
    Key? key,
    required this.panelTiles,
  }) : super(key: key);

  final List<PanelTile> panelTiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: const Border(
          top: appBorderSide,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: panelTiles
              .map((panelTile) => Flexible(child: panelTile))
              .toList(),
        ),
      ),
    );
  }
}
