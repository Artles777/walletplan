import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:mobx/mobx.dart";
import "package:walletplan/store/base/base_bar.dart";
import "package:walletplan/store/base/base_bottom_tabs.dart";

part "base.g.dart";

class BaseState = _BaseState with _$BaseState;

abstract class _BaseState with Store {
  final bar = BaseBarState();
  final bottomTabs = BaseBottomTabsState();

  @observable
  bool premiumAccount = false;
}
