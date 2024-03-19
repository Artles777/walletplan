import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/store/base.dart";
import "package:walletplan/store/home.dart";
import "package:walletplan/widgets/home/adds/add_account/add_account_bar_widget.dart";
import "package:walletplan/widgets/home/adds/add_account/add_account_form_widget.dart";

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<HomeState>(create: (_) => HomeState()),
          Provider<BaseState>(create: (_) => BaseState()),
        ],
        child: const Scaffold(
          backgroundColor: PrimaryColors.primary90,
          appBar: AddAccountBarWidget(),
          body: AddAccountFormWidget(),
        ),
      );
}
