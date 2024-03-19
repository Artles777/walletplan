import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:mobx/mobx.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/store/history.dart";
import "package:walletplan/store/history/history_panel.dart";
import "package:walletplan/widgets/history/list/list_history_item_widget.dart";

class ListHistoryWidget extends StatelessWidget {
  const ListHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final historyState = Provider.of<HistoryState>(context);
    final HistoryPanelState panelState = historyState.panel;

    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: panelState.historyList.length,
      separatorBuilder: (BuildContext context, int index) =>
          panelState.historyList[index] is HistoryItem
              ? const Divider(
                  height: 1.0,
                  color: SecondaryColors.secondary60,
                )
              : const SizedBox(height: 1),
      itemBuilder: (BuildContext context, int index) => ListHistoryItemWidget(
        item: panelState.historyList[index],
        parentItem: index != 0 ? panelState.historyList[index - 1] : null,
      ),
    );
  }
}
