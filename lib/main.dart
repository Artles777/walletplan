import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:provider/provider.dart";
import "package:syncfusion_localizations/syncfusion_localizations.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/router/base_router.dart";
import "package:walletplan/store/base.dart";
import "package:walletplan/store/main.dart";

void main() {
  runApp(const MainApp());
}

extension ContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final theme = MainState().theme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp.router(
        theme: ThemeData(
      primaryColor: PrimaryColors.layerColor[theme],
      useMaterial3: true,
        ),
        builder: (context, child) => Provider<BaseState>(
      create: (_) => BaseState(),
      child: child,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          ...AppLocalizations.localizationsDelegates,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          SfGlobalLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale("ru"),
        routerConfig: BaseRouter.routerList,
      ),
    );
  }
}
