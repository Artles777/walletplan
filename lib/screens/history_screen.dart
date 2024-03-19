import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/store/history.dart";
import "package:walletplan/widgets/commons/wrappers/screen_wrapper.dart";
import "package:walletplan/widgets/history/history_cards_widget.dart";
import "package:walletplan/widgets/history/history_panel_widget.dart";

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) => Provider<HistoryState>(
        create: (_) => HistoryState(),
        child: const ScreenWrapper(
          children: [
            HistoryCardsWidget(),
            HistoryPanelWidget(),
          ],
        ),
      );
}
