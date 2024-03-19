import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/store/home.dart";
import "package:walletplan/widgets/commons/wrappers/screen_wrapper.dart";
import "package:walletplan/widgets/home/home_panel_widget.dart";
import 'package:walletplan/widgets/home/home_finance_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Provider<HomeState>(
        create: (_) => HomeState(),
        child: const ScreenWrapper(
          children: [
            HomeFinanceWidget(),
            HomePanelWidget(),
          ],
        ),
      );
}
