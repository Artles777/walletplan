import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:walletplan/helpers/variables/colors.dart";

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: PrimaryColors.primary90,
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 1.sh,
              maxWidth: 1.sh,
            ),
            child: Stack(
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
