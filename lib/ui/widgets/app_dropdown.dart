import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';
import 'package:flutter_animations_studio/ui/theme.dart';

class AppDropdown<T> extends StatelessWidget {
  AppDropdown({
    Key? key,
    required this.options,
    required this.currentOption,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
    this.onChanged,
    this.isExpanded = true,
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

  final EdgeInsets padding;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.tertiary,
          borderRadius: AppBorderRadius.medium,
          // border: Border.all(width: 0.8, color: context.dropdownBordersColor),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: currentOption,
            items: options.map(
              (option) {
                return DropdownMenuItem(
                  value: option,
                  alignment: Alignment.center,
                  child: Text(
                    option.toString().camelCaseToSpacedTitleCase,
                    style: TextStyle(
                      fontWeight: option == currentOption ? FontWeight.bold : FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ).toList(),
            borderRadius: AppBorderRadius.medium,
            style: context.dropdownTextStyle,
            onChanged: onChanged,
            isExpanded: isExpanded,
            dropdownColor: context.colorScheme.tertiary,
            menuMaxHeight: 300.0,
            padding: [5.0, 10.0].verticalHorizontal,
            elevation: 0,
            isDense: true,
          ),
        ),
      ),
    );
  }
}
