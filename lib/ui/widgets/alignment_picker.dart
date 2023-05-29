import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/extensions.dart';
import 'package:flutter_animations_studio/ui/widgets/app_dropdown.dart';
import 'package:flutter_animations_studio/utils.dart';

const _baseContainerSize = 80.0;
const _dotSize = _baseContainerSize / 4.4;
const _halfDotSize = _dotSize / 2.0;

class _AlignmentPickerDot extends StatelessWidget {
  const _AlignmentPickerDot({
    Key? key,
    required this.alignment,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final Alignment alignment;
  final Function(Alignment)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call(alignment);
      },
      child: Container(
        width: _dotSize,
        height: _dotSize,
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.background,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.onPrimary
                : context.alignmentPickerDot,
          ),
        ),
      ),
    );
  }
}


class AlignmentPicker extends StatelessWidget {
  const AlignmentPicker({
    Key? key,
    required this.currentAlignment,
    this.onAlignmentTap,
  }) : super(key: key);

  final Alignment currentAlignment;
  final Function(Alignment)? onAlignmentTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: [20.0, 20.0, 10.0, 20.0].fromLTRB,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// ALIGNMENTS PICKER'S DOTS
          Stack(
            clipBehavior: Clip.none,
            children: [
              /// BASE CONTAINER
              Container(
                width: _baseContainerSize,
                height: _baseContainerSize,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
              ),

              /// ALIGNMENT DOTS
              ...appAlignments.map((alignment) {
                return Positioned(
                  width: _baseContainerSize,
                  height: _baseContainerSize,
                  left: alignment.isLeft ? - _halfDotSize: null,
                  top: alignment.isTop ? - _halfDotSize: null,
                  right: alignment.isRight ? - _halfDotSize : null,
                  bottom: alignment.isBottom ? - _halfDotSize : null,
                  child: Align(
                    alignment: alignment,
                    child: _AlignmentPickerDot(
                      alignment: alignment,
                      isSelected: currentAlignment == alignment,
                      onTap: onAlignmentTap,
                    ),
                  ),
                );
              }),
            ],
          ),

          /// ALIGNMENTS DROPDOWN
          Flexible(
            child: AppDropdown(
              options: appAlignments.map((alignment) => alignment.name).toList(),
              currentOption: currentAlignment.name,
              onChanged: (newAlignment) {
                if (newAlignment?.isNotEmpty == true) {
                  onAlignmentTap?.call(getAlignmentFromName(newAlignment!));
                }
              },
              padding: 25.0.onlyLeft,
            ),
          ),
        ],
      ),
    );
  }
}
