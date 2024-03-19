import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:mobx/mobx.dart";
import "package:walletplan/helpers/enums/router_enums.dart";

part "base_bottom_tabs.g.dart";

class BaseBottomTabsState = _BaseBottomTabsState with _$BaseBottomTabsState;

abstract class _BaseBottomTabsState with Store {
  @observable
  int currentIndex = 0;

  Map<int, RouterNames> get routeList => {
        0: RouterNames.home,
        1: RouterNames.history,
        2: RouterNames.analytic,
        3: RouterNames.plans,
      };

  @action
  void navigateToTabs(BuildContext context, int index) {
    context.goNamed(routeList[index].toString());
    currentIndex = index;
  }
}
