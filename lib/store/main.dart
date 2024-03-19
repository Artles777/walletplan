import "package:mobx/mobx.dart";
import "package:walletplan/helpers/enums/store_enums.dart";

part "main.g.dart";

class MainState = _MainState with _$MainState;

abstract class _MainState with Store {
  @observable
  bool _hasLightTheme = true;

  @computed
  ThemeEnum get theme => _hasLightTheme ? ThemeEnum.light : ThemeEnum.dark;

  @action
  void changeTheme () {
    _hasLightTheme = !_hasLightTheme;
  }
}