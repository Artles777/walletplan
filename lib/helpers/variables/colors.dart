import "package:flutter/material.dart";
import "package:walletplan/helpers/enums/store_enums.dart";

abstract class LinearColors {
  static LinearGradient greenGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE9D785), Color(0xFF99E2A4)],
  );
}

abstract class PrimaryColors {
  static const Color primary20 = Color(0xFF381E72);
  static const Color primary30 = Color(0xFF4F378B);
  static const Color primary40 = Color(0xFF6750A4);
  static const Color primary60 = Color(0xFF9A82DB);
  static const Color primary70 = Color(0xFFB69DF8);
  static const Color primary80 = Color(0xFFD0BCFF);
  static const Color primary90 = Color(0xFFEADDFF);
  static const Color primary95 = Color(0xFFF6EDFF);
  static const Color primary99 = Color(0xFFFFFBFE);

  static Map<ThemeEnum, Color> get layerColor => ({
    ThemeEnum.light: primary80,
    ThemeEnum.dark: primary30
  });
}

abstract class SecondaryColors {
  static const Color secondary10 = Color(0xFF1D192B);
  static const Color secondary20 = Color(0xFF332D41);
  static const Color secondary40 = Color(0xFF625B71);
  static const Color secondary50 = Color(0xFF7A7289);
  static const Color secondary60 = Color(0xFF958DA5);
  static const Color secondary70 = Color(0xFFB0A7C0);
  static const Color secondary80 = Color(0xFFCCC2DC);
  static const Color secondary90 = Color(0xFFE8DEF8);
}

abstract class ErrorColors {
  static const Color error20 = Color(0xFF601410);
  static const Color error40 = Color(0xFFB3261E);
  static const Color error60 = Color(0xFFE46962);
  static const Color error70 = Color(0xFFEC928E);
  static const Color error90 = Color(0xFFF9DEDC);
  static const Color error95 = Color(0xFFFCEEEE);
}

abstract class TertiaryColors {
  static const tertiary20 = Color(0xFF492532);
  static const tertiary50 = Color(0xFF986977);
  static const tertiary90 = Color(0xFFFFECF1);
}