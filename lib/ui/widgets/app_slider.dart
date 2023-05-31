import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';

enum AppSliderShowType {
  onlyMin,
  onlyMax,
  onlyMinAndMax,
  onlyCurrent,
  all,
}

class AppSlider extends StatefulWidget {
  const AppSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.currentValue,
    required this.appSliderShowType,
    required this.onChanged,
    this.valueType,
  }) : super(key: key);

  final double min;
  final double max;
  final double currentValue;
  final AppSliderShowType appSliderShowType;
  final Function(double) onChanged;

  final String? valueType; // Es.: "ms"

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  late double _currentValue;

  String get _currentValueToText {
    if (widget.valueType?.isNotEmpty == true) {
      return "${widget.currentValue} ${widget.valueType}";
    }
    return widget.currentValue.toString();
  }

  @override
  void initState() {
    super.initState();
    _currentValue = widget.currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
            overlayShape: SliderComponentShape.noOverlay,
            thumbColor: Theme.of(context).colorScheme.onBackground,
            trackHeight: 1.5,
            trackShape: const RoundedRectSliderTrackShape(),
          ),
          child: Slider(
            value: _currentValue,
            min: widget.min,
            max: widget.max,
            divisions: (widget.max - widget.min) ~/ 5,
            onChanged: (newValue) {
              widget.onChanged.call(newValue);
              setState(() {
                _currentValue = newValue;
              });
            },
          ),
        ),
        4.0.verticalSpace,
        Padding(
          padding: 12.0.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.min.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                _currentValueToText, // Es.: "1500 ms"
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.max.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
