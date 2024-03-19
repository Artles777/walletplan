import "package:flutter/material.dart";
import "package:walletplan/helpers/variables/colors.dart";

class IncomeBarWidget extends StatelessWidget with PreferredSizeWidget {
  const IncomeBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PrimaryColors.primary90,
      title: const Text(
        "Новый счёт",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () => {},
          child: const Text(
            "Добавить",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
