import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:mobx/mobx.dart";
import "package:provider/provider.dart";
import "package:walletplan/store/base.dart";
import "package:walletplan/store/home.dart";
import "package:walletplan/store/home/home_chart.dart";
import "package:walletplan/widgets/commons/custom_draggable_sheet_widget.dart";
import "package:walletplan/widgets/home/chart/chart_categories_widget.dart";
import "package:walletplan/widgets/home/chart/chart_settings_widget.dart";
import "package:walletplan/widgets/home/chart/chart_widget.dart";

class HomeChartWidget extends StatelessWidget {
  const HomeChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final baseState = Provider.of<BaseState>(context);
    final state = Provider.of<HomeState>(context);
    final HomeChartState chartState = state.chart;

    return ReactionBuilder(
      builder: (context) =>
          autorun((_) => state.layoutHeight = baseState.layoutHeight),
      child: Observer(
        builder: (_) => CustomDraggableSheetWidget(
          childrenWidgets: const [
            ChartSettingsWidget(),
            ChartCategoriesWidget(),
            ChartWidget(),
          ],
          minSize: state.sizeSheet,
          maxSize: state.layoutHeight,
          controller: chartState.panelController,
        ),
      ),
    );
  }
}
