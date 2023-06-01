import 'package:flutter/material.dart';

import '../widgets/app_panel_tile.dart';

class ConfigurationPanel extends StatelessWidget {
  const ConfigurationPanel({
    Key? key,
    required this.panelTiles,
  }) : super(key: key);

  final List<AppPanelTile> panelTiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: const Border(
          right: BorderSide(
            color: Colors.white,
            width: 0.3,
          ),
        ),
      ),
      child: Column(
        children: panelTiles.map((panelTile) => Flexible(child: panelTile)).toList(),
      ),
    );
  }
}
