import 'package:flutter/material.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/adapters/alignment_picker_adapter.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/adapters/animation_preview_adapter.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/adapters/curves_dropdown_adapter.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/adapters/duration_slider_adapter.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/adapters/reverse_checkbox_adapter.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/adapters/rotate_x_checkbox_adapter.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/adapters/rotate_y_checkbox_adapter.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/adapters/rotate_z_checkbox_adapter.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/adapters/show_alignment_dot_checkbox_adapter.dart';
import 'package:flutter_animations_studio/modules/basic_container_animation/adapters/show_original_position_checkbox_adapter.dart';
import 'package:flutter_animations_studio/ui/pages/create_animation_page.dart';
import 'package:flutter_animations_studio/ui/panels/animation_preview_panel.dart';
import 'package:flutter_animations_studio/ui/panels/code_preview_panel.dart';
import 'package:flutter_animations_studio/ui/panels/configuration_panel.dart';
import 'package:flutter_animations_studio/ui/panels/controller_panel.dart';
import 'package:flutter_animations_studio/ui/widgets/app_accordion.dart';
import 'package:flutter_animations_studio/ui/widgets/panel_tile.dart';


class BasicContainerAnimationPage extends StatelessWidget {
  const BasicContainerAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CreateAnimationPage(
      title: "Basic Container Animation",
      configurationPanel: ConfigurationPanel(
        panelTiles: [
          /// ROTATION
          PanelTile(
            child: AppAccordion(
              title: "Rotation",
              initiallyExpanded: true,
              expandedBody: [
                RotateXCheckboxAdapter(),
                RotateYCheckboxAdapter(),
                RotateZCheckboxAdapter(),
              ],
            ),
          ),
          /// CURVES
          PanelTile(
            child: AppAccordion(
              title: "Curve",
              initiallyExpanded: true,
              expandedBody: [
                CurvesDropdownAdapter(),
              ],
            ),
          ),
          /// ALIGNMENT
          PanelTile(
            child: AppAccordion(
              title: "Alignment",
              initiallyExpanded: true,
              expandedBody: [
                AlignmentPickerAdapter(),
              ],
            ),
          ),
        ],
      ),
      animationPreviewPanel: AnimationPreviewPanel(
        previewOptions: [
          ShowOriginalPositionCheckboxAdapter(),
          ShowAlignmentDotCheckboxAdapter(),
        ],
        animationPreview: BasicContainerAnimationPreviewAdapter(),
      ),
      controllerPanel: ControllerPanel(
        panelTiles: [
          PanelTile(
            child: AppAccordion(
              title: "Duration (ms)",
              initiallyExpanded: true,
              expandedBody: [
                DurationSliderAdapter(),
              ],
            ),
          ),
          PanelTile(
            child: AppAccordion(
              title: "Reverse",
              initiallyExpanded: true,
              expandedBody: [
                ReverseCheckboxAdapter(),
              ],
            ),
          ),
        ],
      ),
      codePreviewPanel: CodePreviewPanel(),
    );
  }
}
