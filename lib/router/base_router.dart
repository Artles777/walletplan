import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:walletplan/core/builders_page/builderBaseWidget.dart";
import "package:walletplan/helpers/enums/router_enums.dart";
import "package:walletplan/router/home/home_router.dart";
import "package:walletplan/screens/analytic_screen.dart";
import "package:walletplan/screens/history_screen.dart";
import "package:walletplan/screens/home_screen.dart";
import "package:walletplan/screens/plans_screen.dart";

class BaseRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: "/${RouterNames.home}",
    routes: [
      GoRoute(
        path: "/${RouterNames.home}",
        name: "${RouterNames.home}",
        // builder: (context, state) => ,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildBaseWidgetNotAnimation(
          child: const HomeScreen(),
        ),
        routes: [...HomeRouter.homeRouteList],
      ),
      GoRoute(
        path: "/${RouterNames.history}",
        name: "${RouterNames.history}",
        // builder: (context, state) => const BaseWidget(child: HistoryScreen()),
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildBaseWidgetNotAnimation(
          child: const HistoryScreen(),
        ),
      ),
      GoRoute(
        path: "/${RouterNames.analytic}",
        name: "${RouterNames.analytic}",
        // builder: (context, state) => const BaseWidget(child: HistoryScreen()),
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildBaseWidgetNotAnimation(
          child: const AnalyticScreen(),
        ),
      ),
      GoRoute(
        path: "/${RouterNames.plans}",
        name: "${RouterNames.plans}",
        // builder: (context, state) => const BaseWidget(child: HistoryScreen()),
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildBaseWidgetNotAnimation(
          child: const PlansScreen(),
        ),
      ),
    ],
  );

  static GoRouter get routerList => _router;
}
