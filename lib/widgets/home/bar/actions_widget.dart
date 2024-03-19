import "package:flutter/material.dart";

class ActionButton extends StatefulWidget {
  const ActionButton({
    required this.handler,
    required this.iconName,
    super.key,
  });

  final void Function() handler;
  final IconData? iconName;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  static const padding = EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.handler,
      icon: Icon(widget.iconName),
      padding: padding,
    );
  }
}
