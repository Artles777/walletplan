import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walletplan/helpers/variables.dart';
import 'package:walletplan/store/base.dart';
import 'package:walletplan/widgets/home/bar/actions_widget.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bar = Provider.of<BaseState>(context).bar;

    return AppBar(
      centerTitle: false,
      title: TextButton(
        onPressed: bar.showCalendar,
        child: Text(
          bar.dateRange,
          style: TextStyle(fontSize: 16, color: CustomColors.darkBlue),
        ),
      ),
      actions: [
        ActionButton(
          iconName: Icons.search,
          handler: bar.searchHandler,
        ),
        ActionButton(
          iconName: Icons.settings,
          handler: bar.openSettings,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
