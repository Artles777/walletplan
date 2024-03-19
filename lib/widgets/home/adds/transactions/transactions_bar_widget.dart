import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:mobx/mobx.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/enums/store_enums.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/store/home.dart";
import "package:walletplan/widgets/commons/buttons/action_button_widget.dart";

class TransactionsBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const TransactionsBarWidget({
    super.key,
    required this.typeScreen,
  });

  final TransactionNameEnum typeScreen;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeState>(context);
    final transactionsState = state.adds.transactions;

    return AppBar(
      backgroundColor: PrimaryColors.primary90,
      title: ReactionBuilder(
        builder: (context) =>
            autorun((_) => transactionsState.transactionName = typeScreen),
        child: Observer(
          builder: (_) => Text(
            transactionsState.transactionConvertedName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        ActionButtonWidget(onPressed: () => {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
