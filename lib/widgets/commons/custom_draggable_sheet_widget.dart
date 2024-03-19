import "package:flutter/material.dart";
import "package:sliding_up_panel/sliding_up_panel.dart";
import "package:walletplan/helpers/variables/colors.dart";

class CustomDraggableSheetWidget extends StatelessWidget {
  const CustomDraggableSheetWidget({
    required this.childWidget,
    this.body,
    this.minSize = 300,
    this.maxSize = double.infinity,
    this.controller,
    this.onPanelSlide,
    super.key,
  });

  final Widget childWidget;
  final Widget? body;
  final double minSize;
  final double maxSize;
  final PanelController? controller;
  final void Function(double position)? onPanelSlide;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: controller,
      minHeight: minSize,
      maxHeight: maxSize,
      color: PrimaryColors.primary99,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      onPanelSlide: onPanelSlide,
      panel: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 16.0,
          right: 16.0,
        ),
        child: childWidget,
      ),
      body: body,
    );
  }
}
