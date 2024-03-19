import "package:flutter/material.dart";
import "package:walletplan/helpers/variables/colors.dart";

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1.0,
      color: PrimaryColors.primary80,
      indent: 16,
      endIndent: 16,
    );
  }
}
