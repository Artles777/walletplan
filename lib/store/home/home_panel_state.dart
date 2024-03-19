import "package:mobx/mobx.dart";
import "package:walletplan/store/home/home_chart.dart";

part "home_panel_state.g.dart";

class HomePanelState = _HomePanelState with _$HomePanelState;

abstract class _HomePanelState with Store {
  final chart = HomeChartState();
}
