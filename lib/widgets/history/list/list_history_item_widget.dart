import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/main.dart";
import "package:walletplan/store/history.dart";
import "package:walletplan/store/history/history_panel.dart";

class ListHistoryItemWidget extends StatelessWidget {
  const ListHistoryItemWidget({
    super.key,
    required this.item,
    required this.parentItem,
  });

  final HistoryItem item;
  final HistoryItem? parentItem;

  @override
  Widget build(BuildContext context) {
    final historyState = Provider.of<HistoryState>(context);
    final HistoryPanelState panelState = historyState.panel;

    final String amountText =
        NumberFormat.simpleCurrency(name: "RUB", locale: "Ru-ru")
            .format(item.amount);

    final String descriptionText = item.description;

    return item.date == parentItem?.date
        ? SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(iconsMap[item.category]),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.category),
                      Text(
                        maxLines: 1,
                        style: const TextStyle(
                          color: SecondaryColors.secondary40,
                        ),
                        descriptionText,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(amountText),
                    SizedBox(
                      height: 20,
                      child: TextButton(
                        onPressed: () => {},
                        style: TextButton.styleFrom(
                          foregroundColor: ErrorColors.error40,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text("Удалить"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        : SizedBox(
            height: 110,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 24.0),
                  child: Row(
                    children: [
                      Text(
                        item.date,
                        style: const TextStyle(
                          color: SecondaryColors.secondary40,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          height: 1.0,
                          indent: 12.0,
                          color: SecondaryColors.secondary60,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(iconsMap[item.category]),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.category),
                          Text(
                            maxLines: 1,
                            style: const TextStyle(
                              color: SecondaryColors.secondary40,
                            ),
                            descriptionText,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(amountText),
                        SizedBox(
                          height: 20,
                          child: TextButton(
                            onPressed: () => {},
                            style: TextButton.styleFrom(
                              foregroundColor: ErrorColors.error40,
                              padding: EdgeInsets.zero,
                            ),
                            child: Text("Удалить"),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
