import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:mobx/mobx.dart";
import "package:provider/provider.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/helpers/variables/sizes.dart";
import "package:walletplan/store/history.dart";
import "package:walletplan/store/history/history_panel.dart";
import "package:walletplan/widgets/commons/custom_draggable_sheet_widget.dart";
import "package:walletplan/widgets/history/list/list_history_widget.dart";

class HistoryPanelWidget extends StatelessWidget {
  const HistoryPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final historyState = Provider.of<HistoryState>(context);

    return ReactionBuilder(
      builder: (_) => autorun(
        (_) => {
          historyState.setFocusSearch(context),
          historyState.searchFocusNode.unfocus(),
        },
      ),
      child: CustomDraggableSheetWidget(
        minSize: historyState.minSizePanelHistory,
        maxSize: historyState.layoutSize,
        controller: historyState.panelController,
        childWidget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Divider(
                height: 1.0,
                color: PrimaryColors.primary80,
                indent: 0.3.sw,
                endIndent: 0.3.sw,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    constraints: BoxConstraints(
                      maxWidth: 0.65.sw,
                    ),
                    border: historyState.searchFocusNode.hasFocus
                        ? const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: SecondaryColors.secondary90,
                            ),
                          )
                        : InputBorder.none,
                  ),
                  focusNode: historyState.searchFocusNode,
                  onChanged: (String value) => {},
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => {},
                      iconSize: IconSizes.medium,
                      icon: const Icon(Icons.tune_outlined),
                    ),
                    IconButton(
                      onPressed: () => {},
                      iconSize: IconSizes.medium,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            SafeArea(
              minimum: const EdgeInsets.only(
                top: 20.0,
                left: 16.0,
                right: 16.0,
              ),
              child: SizedBox(
                height: historyState.minSizePanelHistory - 50,
                child: const ListHistoryWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
