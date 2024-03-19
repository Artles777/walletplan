import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:walletplan/helpers/enums/router_enums.dart";
import "package:walletplan/helpers/enums/store_enums.dart";
import "package:walletplan/screens/home/edit_account_screen.dart";
import "package:walletplan/screens/home/add_card_screen.dart";
import "package:walletplan/screens/home/transactions_screen.dart";

class HomeRouter {
  static final _homeRouteList = [
    GoRoute(
      path: "${HomeRouterNames.addCard}",
      name: "${HomeRouterNames.addCard}",
      builder: (BuildContext context, GoRouterState state) =>
          const AddCarsScreen(),
    ),
    GoRoute(
      path: "${HomeRouterNames.transactions}",
      name: "${HomeRouterNames.transactions}",
      builder: (BuildContext context, GoRouterState state) =>
          TransactionsScreen(typeScreen: state.extra as TransactionNameEnum),
    ),
    GoRoute(
      path: "${HomeRouterNames.editAccount}",
      name: "${HomeRouterNames.editAccount}",
      builder: (BuildContext context, GoRouterState state) =>
          const EditAccountScreen(),
    ),
  ];

  static List<GoRoute> get homeRouteList => _homeRouteList;
}
