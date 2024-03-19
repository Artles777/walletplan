import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:walletplan/widgets/baseWidget.dart";

CustomTransitionPage buildBaseWidgetNotAnimation({
  required Widget child,
}) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        BaseWidget(child: child),
  );
}
