import "dart:ffi";

import "package:flutter/material.dart";
import "package:walletplan/helpers/variables/colors.dart";

class CustomBottomSheetWidget extends StatelessWidget {
  const CustomBottomSheetWidget({required this.childrenWidgets, super.key});
  final List<Widget> childrenWidgets;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController) => Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: PrimaryColors.primary99,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      children: childrenWidgets,
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
