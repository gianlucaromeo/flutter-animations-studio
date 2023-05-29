import 'package:flutter/material.dart';

class CurvePreview extends StatefulWidget {
  const CurvePreview({
    Key? key,
    required this.curve,
  }) : super(key: key);

  final Curve curve;

  @override
  State<CurvePreview> createState() => _CurvePreviewState();
}

class _CurvePreviewState extends State<CurvePreview> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(

    );
  }
}
