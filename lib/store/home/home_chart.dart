import 'package:flutter/material.dart';
import "package:mobx/mobx.dart";
import "package:sliding_up_panel/sliding_up_panel.dart";
import "package:walletplan/helpers/enums/router_enums.dart";

part "home_chart.g.dart";

class HomeChartState = _HomeChartState with _$HomeChartState;

class CategoryIcon {
  CategoryIcon({required this.name, required this.icon, required this.color});

  String name;
  IconData icon;
  Color color;
}

abstract class _HomeChartState with Store {
  final ScrollController _categoryController = ScrollController();
  final PanelController _panelController = PanelController();

  @observable
  ChartSelected chartSelected = ChartSelected.liner;

  @computed
  bool get hasSelectedLiner => chartSelected == ChartSelected.liner;

  @computed
  bool get hasSelectedBar => chartSelected == ChartSelected.bar;

  @computed
  bool get hasSelectedPie => chartSelected == ChartSelected.pie;

  @observable
  ObservableList<CategoryIcon> categoriesList =
      ObservableList<CategoryIcon>.of([
    CategoryIcon(
      name: "products",
      icon: Icons.restaurant,
      color: Colors.black,
    ),
    CategoryIcon(
      name: "products",
      icon: Icons.restaurant,
      color: Colors.amber,
    ),
    CategoryIcon(
      name: "products",
      icon: Icons.restaurant,
      color: Colors.amber,
    ),
    CategoryIcon(
      name: "products",
      icon: Icons.restaurant,
      color: Colors.amber,
    ),
    CategoryIcon(
      name: "products",
      icon: Icons.restaurant,
      color: Colors.amber,
    ),
    CategoryIcon(
      name: "products",
      icon: Icons.restaurant,
      color: Colors.amber,
    ),
    CategoryIcon(
      name: "products",
      icon: Icons.restaurant,
      color: Colors.amber,
    ),
    CategoryIcon(
      name: "products",
      icon: Icons.restaurant,
      color: Colors.amber,
    ),
    CategoryIcon(
      name: "products",
      icon: Icons.restaurant,
      color: Colors.amber,
    ),
    CategoryIcon(
      name: "products",
      icon: Icons.restaurant,
      color: Colors.amber,
    ),
  ]);

  @computed
  ScrollController get categoryScrollController => _categoryController;

  @computed
  PanelController get panelController => _panelController;

  @action
  void openChartSettings() {
    print("chart settings");
  }

  @action
  void changeViewChart(ChartSelected value) {
    chartSelected = value;
  }

  @action
  void handlerScrollCategories(CategoryDirection direction) {
    int scrollPixels = direction == CategoryDirection.right ? 50 : -50;
    categoryScrollController.animateTo(
      categoryScrollController.position.pixels + scrollPixels,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @action
  resetDragableController() {
    panelController.close();
  }
}
