
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTextWidget extends StatefulWidget {
  final String label;
  final String hintText;
  TextEditingController? controller;

  EditTextWidget({required this.label, required this.hintText, this.controller});

  @override
  State<EditTextWidget> createState() => _EditTextWidgetState();
}

class _EditTextWidgetState extends State<EditTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: Text(widget.label),
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
          filled: true,
        ),
        onSaved: (String? val) {

        },
      ),
    );
  }
}
