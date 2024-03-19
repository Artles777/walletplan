import "package:flutter/material.dart";
import "package:walletplan/helpers/variables/colors.dart";
import "package:walletplan/widgets/commons/buttons/action_button_widget.dart";

class EditAccountBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const EditAccountBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PrimaryColors.primary90,
      centerTitle: true,
      title: const Text(
        "Редактировать счет",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        ActionButtonWidget(
          title: "Сохранить",
          onPressed: () => {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
