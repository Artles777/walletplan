import "package:flutter/material.dart";

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({
    super.key,
    this.onPressed,
    this.title = "Добавить",
  });

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
