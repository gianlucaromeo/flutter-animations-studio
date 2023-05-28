import 'package:flutter/material.dart';

const animatedContainerSize = 75.0;

const alignments = [
  [Alignment.topLeft, Icons.vertical_align_top_outlined],
  [Alignment.topCenter, Icons.vertical_align_top_outlined],
  [Alignment.topRight, Icons.vertical_align_top_outlined],
  [Alignment.centerLeft, Icons.vertical_align_center],
  [Alignment.center, Icons.vertical_align_center],
  [Alignment.centerRight, Icons.vertical_align_center],
  [Alignment.bottomLeft, Icons.vertical_align_bottom_outlined],
  [Alignment.bottomCenter, Icons.vertical_align_bottom_outlined],
  [Alignment.bottomRight, Icons.vertical_align_bottom_outlined],
];

const appAlignments = [
  Alignment.topLeft,
  Alignment.topCenter,
  Alignment.topRight,
  Alignment.centerLeft,
  Alignment.center,
  Alignment.centerRight,
  Alignment.bottomLeft,
  Alignment.bottomCenter,
  Alignment.bottomRight,
];

Alignment getAlignmentFromName(String name) {
  if (name == "Top Left") return Alignment.topLeft;
  if (name == "Top Right") return Alignment.topRight;
  if (name == "Top Center") return Alignment.topCenter;
  if (name == "Center Left") return Alignment.centerLeft;
  if (name == "Center Right") return Alignment.centerRight;
  if (name == "Center") return Alignment.center;
  if (name == "Bottom Left") return Alignment.bottomLeft;
  if (name == "Bottom Right") return Alignment.bottomRight;
  if (name == "Bottom Center") return Alignment.bottomCenter;
  throw Exception("Cannot detect the correct alignment.");
}