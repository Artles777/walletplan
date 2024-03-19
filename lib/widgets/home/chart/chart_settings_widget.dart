import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/enums/router_enums.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/helpers/variables/sizes.dart";
import "package:walletplan/main.dart";
import "package:walletplan/store/home.dart";
import "package:walletplan/store/home/home_chart.dart";

class ChartSettingsWidget extends StatelessWidget {
  const ChartSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);
    final HomeChartState chart = state.panel.chart;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: chart.openChartSettings,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: SecondaryColors.secondary10,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.settings_input_component_outlined),
                ),
                Text(
                  context.l10n.settings_chart,
                  style: const TextStyle(
                    color: SecondaryColors.secondary10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Observer(
          builder: (_) => Row(
            children: [
              IconButton(
                onPressed: () => chart.changeViewChart(ChartSelected.liner),
                constraints: const BoxConstraints(minHeight: 32),
                icon: const Icon(Icons.timeline_rounded),
                style: IconButton.styleFrom(
                  foregroundColor: chart.hasSelectedLiner
                      ? PrimaryColors.primary95
                      : PrimaryColors.primary40,
                  backgroundColor: chart.hasSelectedLiner
                      ? PrimaryColors.primary40
                      : Colors.transparent,
                  iconSize: IconSizes.small,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                    side: BorderSide(width: 1, color: PrimaryColors.primary40),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => chart.changeViewChart(ChartSelected.bar),
                constraints: const BoxConstraints(minHeight: 32),
                icon: const Icon(
                  Icons.bar_chart,
                ),
                style: IconButton.styleFrom(
                  foregroundColor: chart.hasSelectedBar
                      ? PrimaryColors.primary95
                      : PrimaryColors.primary40,
                  backgroundColor: chart.hasSelectedBar
                      ? PrimaryColors.primary40
                      : Colors.transparent,
                  iconSize: IconSizes.small,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: PrimaryColors.primary40),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => chart.changeViewChart(ChartSelected.pie),
                constraints: const BoxConstraints(minHeight: 32),
                icon: const Icon(
                  Icons.donut_large,
                ),
                style: IconButton.styleFrom(
                  foregroundColor: chart.hasSelectedPie
                      ? PrimaryColors.primary95
                      : PrimaryColors.primary40,
                  backgroundColor: chart.hasSelectedPie
                      ? PrimaryColors.primary40
                      : Colors.transparent,
                  iconSize: IconSizes.small,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                    side: BorderSide(width: 1, color: PrimaryColors.primary40),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
