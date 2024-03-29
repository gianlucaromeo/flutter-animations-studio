import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/ui/theme.dart';

import '../widgets/app_panel_tile.dart';

class ControllerPanel extends StatelessWidget {
  const ControllerPanel({
    Key? key,
    required this.panelTiles,
  }) : super(key: key);

  final List<AppPanelTile> panelTiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: AppBorderRadius.medium,
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
