import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';

class AppCheckbox extends StatefulWidget {
  const AppCheckbox({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool initialValue;
  final Function(bool) onChanged;

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  late bool _currentValue;

  _resetInitialValue() {
    _currentValue = widget.initialValue;
  }

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    if (_currentValue != widget.initialValue) {
      _resetInitialValue();
    }
    return Row(
      children: [
        Checkbox(
          value: _currentValue,
          onChanged: (_) {
            setState(() => _currentValue = !_currentValue);
            widget.onChanged.call(_currentValue);
          },
        ),
        Text(
          widget.label,
          style: context.checkboxTextStyle!.copyWith(
            fontWeight: _currentValue ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
