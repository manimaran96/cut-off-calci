

import 'package:cut_off_calci/components/button.dart';
import 'package:cut_off_calci/components/custom_text.dart';
import 'package:cut_off_calci/components/edit_text.dart';
import 'package:cut_off_calci/utils/app_constants.dart';
import 'package:flutter/material.dart';

class InputFieldsPage extends StatefulWidget {
  late CalculationType type;
  InputFieldsPage({required this.type, Key? key}) : super(key: key);

  @override
  State<InputFieldsPage> createState() => _InputFieldsPageState();
}

class _InputFieldsPageState extends State<InputFieldsPage> {

  TextEditingController mathsController = TextEditingController();
  TextEditingController chemistryController = TextEditingController();
  TextEditingController physicsController = TextEditingController();
  TextEditingController biologyController = TextEditingController();
  TextEditingController botanyController = TextEditingController();
  TextEditingController zoologyController = TextEditingController();

  double? _result;

  @override
  Widget build(BuildContext context) {
    debugPrint((widget.type).toString());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            if (showMathsInput(widget.type))
              EditTextWidget(label: "Maths", hintText: "Enter your maths mark", controller: mathsController,),
            if (showBiologyInput(widget.type))
              EditTextWidget(label: "Biology", hintText: "Enter your biology mark", controller: biologyController),
            if (showBotanyInput(widget.type))
              EditTextWidget(label: "Botany", hintText: "Enter your botany mark", controller: botanyController),
            if (showZoologyInput(widget.type))
              EditTextWidget(label: "Zoology", hintText: "Enter your zoology mark", controller: zoologyController),
            EditTextWidget(label: "Chemistry", hintText: "Enter your chemistry mark", controller: chemistryController,),
            EditTextWidget(label: "Physics", hintText: "Enter your physics mark", controller: physicsController,),
            ButtonWidget(() {
              if (showMathsInput(widget.type) && mathsController.text.isEmpty) {
                showErrorMsg("maths");
              } else if (showBiologyInput(widget.type) && biologyController.text.isEmpty) {
                showErrorMsg("biology");
              } else if (showBotanyInput(widget.type) && botanyController.text.isEmpty) {
                showErrorMsg("botany");
              }else if (showZoologyInput(widget.type) && zoologyController.text.isEmpty) {
                showErrorMsg("zoology");
              } else if (chemistryController.text.isEmpty) {
                  showErrorMsg("chemistry");
              } else if (physicsController.text.isEmpty) {
                showErrorMsg("physics");
              } else {
                setState(() {
                  _result = calculateCutOffMark(widget.type);
                });
              }
            }),
            Visibility(
              visible: (_result ?? 0) > 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Hi Student, \nYour '${widget.type.name}' cut of mark is:",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$_result",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomTextWidget("Note: ${widget.type.displayCalculationMethod}"),
          ],
        ),
      ),
    );
  }

  bool showMathsInput(CalculationType? type) {
    return [CalculationType.Engineering, CalculationType.Agriculture].contains(type);
  }

  bool showBiologyInput(CalculationType? type) {
    return [CalculationType.Medical_Bio_Maths, CalculationType.Agriculture].contains(type);
  }

  bool showBotanyInput(CalculationType? type) {
    return [CalculationType.Medical_Pure_Science].contains(type);
  }

  bool showZoologyInput(CalculationType? type) {
    return [CalculationType.Medical_Pure_Science].contains(type);
  }

  // Show error message
  void showErrorMsg(String inputField) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Enter valid $inputField mark"),));
  }


  double? calculateCutOffMark(CalculationType type) {
    int maths = mathsController.getValidMark();
    int chemistry = chemistryController.getValidMark();
    int physics = physicsController.getValidMark();
    int biology = biologyController.getValidMark();
    int botany = botanyController.getValidMark();
    int zoology = zoologyController.getValidMark();

    double mark = 0;
    switch(type) {
      case CalculationType.Engineering:
        mark =  (maths/2) + (chemistry/4) + (physics/4);
        break;
      case CalculationType.Medical_Bio_Maths:
        mark =  (biology/2) + (chemistry/4) + (physics/4);
        break;
      case CalculationType.Medical_Pure_Science:
        mark =  (botany/4) + (zoology/4) + (chemistry/4) + (physics/4);
        break;
      case CalculationType.Agriculture:
        mark =  (biology/4) + (maths/4) + (chemistry/4) + (physics/4);
        break;
      default:
        break;
    }
    return mark;
  }
}

