import "package:flutter/material.dart";
import "package:walletplan/widgets/home/chart/chart_categories_widget.dart";
import "package:walletplan/widgets/home/chart/chart_settings_widget.dart";
import "package:walletplan/widgets/home/chart/chart_widget.dart";

class ChartWrapperWidget extends StatelessWidget {
  const ChartWrapperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChartSettingsWidget(),
        ChartCategoriesWidget(),
        ChartWidget(),
      ],
    );
  }
}
