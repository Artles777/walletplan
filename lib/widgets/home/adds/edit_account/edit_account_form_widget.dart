import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/store/base.dart";
import "package:walletplan/store/home.dart";

class AddAccountFormWidget extends StatelessWidget {
  const AddAccountFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);
    final baseState = Provider.of<BaseState>(context);

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: PrimaryColors.primary99),
                child: SafeArea(
                  minimum: const EdgeInsets.only(
                    top: 20.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            )
          ]),
        )
      ],
    );
  }
}
