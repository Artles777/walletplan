import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/enums/router_enums.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/helpers/variables/sizes.dart";
import "package:walletplan/store/home.dart";
import "package:walletplan/store/home/home_chart.dart";

class ChartCategoriesWidget extends StatelessWidget {
  const ChartCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final chart = Provider.of<HomeState>(context).panel.chart;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            final position = chart.categoryScrollController.position;
            if (position.minScrollExtent != position.pixels) {
              chart.handlerScrollCategories(CategoryDirection.left);
            }
          },
          icon: const Icon(Icons.chevron_left),
          iconSize: IconSizes.medium,
        ),
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: PrimaryColors.primary90),
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SizedBox(
                height: 32,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListView.builder(
                    controller: chart.categoryScrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: chart.categoriesList.length,
                    itemBuilder: (BuildContext context, index) {
                      return _CategoryWidget(item: chart.categoriesList[index]);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            final position = chart.categoryScrollController.position;
            if (position.maxScrollExtent != position.pixels) {
              chart.handlerScrollCategories(CategoryDirection.right);
            }
          },
          icon: const Icon(Icons.chevron_right),
          iconSize: IconSizes.medium,
        ),
      ],
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  const _CategoryWidget({required this.item, super.key});

  final CategoryIcon item;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);

    return IconButton(
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: item.color,
      ),
      constraints: const BoxConstraints(
        minWidth: 24,
        minHeight: 24,
      ),
      iconSize: IconSizes.small,
      onPressed: () => {},
      icon: Icon(
        item.icon,
        color: state.luminanceColor(item.color),
      ),
    );
  }
}
