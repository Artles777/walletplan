import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/main.dart";
import 'package:walletplan/store/home.dart';
import 'package:walletplan/store/home/home_finance.dart';

class FinanceButtonsWidget extends StatelessWidget {
  const FinanceButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);
    final HomeFinanceState finance = state.finance;

    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                foregroundColor: Colors.black,
                backgroundColor: PrimaryColors.primary60,
                shadowColor: PrimaryColors.primary70,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              onPressed: () => finance.navigateIncomeScreen(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.l10n.income,
                        style: const TextStyle(
                          color: PrimaryColors.primary90,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.add,
                      color: PrimaryColors.primary95,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                foregroundColor: Colors.black,
                backgroundColor: ErrorColors.error60,
                shadowColor: ErrorColors.error70,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              onPressed: () => finance.navigateExpenseScreen(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.l10n.expense,
                        style: const TextStyle(
                          color: ErrorColors.error90,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.remove,
                      color: ErrorColors.error95,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
