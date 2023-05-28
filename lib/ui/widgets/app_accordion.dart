import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';

class AppAccordion extends StatelessWidget {
  const AppAccordion({
    Key? key,
    required this.title,
    required this.expandedBody,
    this.initiallyExpanded = false,
  }) : super(key: key);

  final String title;
  final List<Widget> expandedBody;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: [0.0, 10.0].verticalHorizontal,
        childrenPadding: [4.0, 0.0, 4.0, 12.0].fromLTRB,
        title: Text(title, style: context.appAccordionTitle),
        maintainState: true,
        initiallyExpanded: initiallyExpanded,
        children: expandedBody,
      ),
    );
  }
}
