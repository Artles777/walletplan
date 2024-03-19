import "dart:math";

import "package:flutter/services.dart";

class AmountInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.contains(".") && newValue.text.split(".")[1].length > 2) {
      return newValue.replaced(
        TextRange(
          start: oldValue.text.length,
          end: newValue.text.length,
        ),
        "",
      );
    }
    return newValue;
  }
}
