import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/store/base.dart";
import "package:walletplan/store/home.dart";
import "package:walletplan/widgets/home/adds/add_card/add_card_bar_widget.dart";
import "package:walletplan/widgets/home/adds/add_card/add_card_form_widget.dart";

class AddCarsScreen extends StatelessWidget {
  const AddCarsScreen({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<HomeState>(create: (_) => HomeState()),
          Provider<BaseState>(create: (_) => BaseState()),
        ],
        child: const Scaffold(
          backgroundColor: PrimaryColors.primary90,
          appBar: AddCardBarWidget(),
          body: AddCardFormWidget(),
        ),
      );
}
