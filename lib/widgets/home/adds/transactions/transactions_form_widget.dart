import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:mobx/mobx.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/helpers/variables/sizes.dart";
import "package:walletplan/store/base.dart";
import "package:walletplan/store/home.dart";

import 'package:walletplan/helpers/formatters/amount_input_formatter.dart';

class IncomeFormWidget extends StatelessWidget {
  const IncomeFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);
    final baseState = Provider.of<BaseState>(context);
    final transactionsState = state.adds.transactions;

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: PrimaryColors.primary99,
                ),
                child: SafeArea(
                  minimum: const EdgeInsets.only(
                    top: 20.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ReactionBuilder(
                            builder: (context) => autorun(
                              (_) => transactionsState.focusAmountField(),
                            ),
                            child: Expanded(
                              child: TextField(
                                onChanged: (value) =>
                                    transactionsState.changeAmount(value),
                                onEditingComplete:
                                    transactionsState.completeEditingAmount,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r"^(0\.?\d?\d?)|[1-9]\d*\.?"),
                                  ),
                                  AmountInputFormatter(),
                                ],
                                focusNode: transactionsState.amountFocusNode,
                                controller: transactionsState.amountController,
                                decoration: const InputDecoration(
                                  labelText: "Сумма",
                                  hintText: "0.00",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: IconButton(
                              onPressed: transactionsState.focusAmountField,
                              iconSize: IconSizes.large,
                              icon: Icon(Icons.qr_code_scanner),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
