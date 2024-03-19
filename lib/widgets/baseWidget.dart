import "package:flutter/material.dart";
import "package:walletplan/widgets/base/base_bar_widget.dart";
import "package:walletplan/widgets/base/base_bottom_tabs_widget.dart";

class BaseWidget extends StatelessWidget {
  const BaseWidget({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Text("drawer"),
      ),
      appBar: const BaseBarWidget(),
      body: child,
      bottomNavigationBar: const BaseBottomTabsWidget(),
    );
  }
}
