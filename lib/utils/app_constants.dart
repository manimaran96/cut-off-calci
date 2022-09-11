
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AppConstants {

}

enum CalculationType{
  Engineering,
  Medical_Bio_Maths,
  Medical_Pure_Science,
  Agriculture
}

extension CalculationMethod on CalculationType {
  String get name => describeEnum(this).replaceAll("_", " ");

  String get displayCalculationMethod {
    switch (this) {
      case CalculationType.Engineering:
        return 'Engineering Cut-off = (Maths / 2) + (Chemistry / 4) + (Physics / 4)';
      case CalculationType.Medical_Bio_Maths:
        return 'Medical Cut-off (Bio maths) = (Biology / 2) + (Chemistry / 4) + (Physics / 4)';
      case CalculationType.Medical_Pure_Science:
        return 'Medical Cut-off (Pure Science) = (Botany / 4) + (Zoology / 4) + (Chemistry / 4) + (Physics / 4)';
      case CalculationType.Agriculture:
        return 'Agriculture Cut-off = (Biology / 4) + (Maths / 4) + (Chemistry / 4) + (Physics / 4)';
      default:
        return '';
    }
  }
}

extension TextFieldControllerExtension on TextEditingController {
  int getValidMark() {
    String value = text.toString();
    if (value.isNotEmpty) {
      return int.parse(value);
    } else {
      return 0;
    }
  }
}