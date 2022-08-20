

import 'package:cut_off_calci/components/button.dart';
import 'package:cut_off_calci/components/edit_text.dart';
import 'package:cut_off_calci/utils/app_constants.dart';
import 'package:flutter/material.dart';

class InputFieldsPage extends StatefulWidget {
  final CalculationType? type;
  InputFieldsPage({required this.type, Key? key}) : super(key: key);

  @override
  State<InputFieldsPage> createState() => _InputFieldsPageState();
}

class _InputFieldsPageState extends State<InputFieldsPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint((widget.type ?? CalculationType.Engineering).toString());
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (showMathsInput(widget.type))
              EditTextWidget(label: "Maths", hintText: "Enter your maths mark"),
            if (showBiologyInput(widget.type))
              EditTextWidget(label: "Biology", hintText: "Enter your biology mark"),
            if (showBotanyInput(widget.type))
              EditTextWidget(label: "Botany", hintText: "Enter your botany mark"),
            if (showZoologyInput(widget.type))
              EditTextWidget(label: "Zoology", hintText: "Enter your zoology mark"),
            EditTextWidget(label: "Chemistry", hintText: "Enter your chemistry mark"),
            EditTextWidget(label: "Physics", hintText: "Enter your physics mark"),
            ButtonWidget()
          ],
        ),
      ),
    );
  }

  /// Engineering Cut-off = (Maths / 2) + (Chemistry / 4) + (Physics / 4)
  /// Medical Cut-off (Biomaths) = (Biology / 2) + (Chemistry / 4) + (Physics / 4)
  /// Medical Cut-off (Pure Science) = (Botany / 4) + (Zoology / 4) + (Chemistry / 4) + (Physics / 4)
  /// Agriculture Cut-off = (Biology / 4) + (Maths / 4) + (Chemistry / 4) + (Physics / 4)

  bool showMathsInput(CalculationType? type) {
    return [CalculationType.Engineering, CalculationType.Agriculture].contains(type);
  }

  bool showBiologyInput(CalculationType? type) {
    return [CalculationType.Medical_Maths_Science, CalculationType.Agriculture].contains(type);
  }

  bool showBotanyInput(CalculationType? type) {
    return [CalculationType.Medical_Pure_Science].contains(type);
  }

  bool showZoologyInput(CalculationType? type) {
    return [CalculationType.Medical_Pure_Science].contains(type);
  }
}

