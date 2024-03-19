import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/store/base.dart";
import "package:walletplan/widgets/home/bar/actions_widget.dart";

class BaseBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const BaseBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final baseState = Provider.of<BaseState>(context);
    final barState = baseState.bar;

    return AppBar(
      centerTitle: true,
      backgroundColor: PrimaryColors.primary90,
      iconTheme: const IconThemeData(color: SecondaryColors.secondary10),
      title: TextButton(
        onPressed: barState.showCalendar,
        child: Text(
          barState.dateRange,
          style: const TextStyle(fontSize: 16, color: PrimaryColors.primary20),
        ),
      ),
      actions: [
        ActionButton(
          iconName: Icons.search,
          handler: barState.searchHandler,
        ),
        ActionButton(
          iconName: Icons.notifications_none,
          handler: barState.openNotifications,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
