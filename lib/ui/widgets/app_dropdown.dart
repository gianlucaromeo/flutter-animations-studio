import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';
import 'package:flutter_animations_studio/ui/theme.dart';

class AppDropdown<T> extends StatelessWidget {
  AppDropdown({
    Key? key,
    required this.options,
    required this.currentOption,
    this.onChanged,
  }) : super(key: key) {
    assert(
      options.contains(currentOption),
      "\"currentOption\" must be a value contained in the \"options\" list."
      "\n\tcurrentOption: $currentOption"
      "\n\toptions: ${options.toString()}",
    );
  }

  final List<T> options;
  final T currentOption;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 10.0.horizontal,
      child: Container(
        decoration: BoxDecoration(
          color: context.dropdownMenuColor,
          borderRadius: AppBorderRadius.small,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: currentOption,
            items: options.map(
              (option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(
                    option.toString(),
                    style: context.tileTitle,
                  ),
                );
              },
            ).toList(),
            onChanged: onChanged,
            isExpanded: true,
            dropdownColor: context.dropdownMenuColor,
            menuMaxHeight: 300.0,
            style: context.tileTitle,
            padding: [8.0, 10.0].verticalHorizontal,
            elevation: 0,
            isDense: true,
          ),
        ),
      ),
    );
  }
}
