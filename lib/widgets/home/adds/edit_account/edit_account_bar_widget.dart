import "package:flutter/material.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/widgets/commons/buttons/add_button_widget.dart";

class AddAccountBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AddAccountBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PrimaryColors.primary90,
      centerTitle: true,
      title: const Text(
        "Новый счет",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        AddButtonWidget(onPressed: () => {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
