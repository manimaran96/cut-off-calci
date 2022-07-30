
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTextWidget extends StatefulWidget {
  final String label;
  final String hintText;

  EditTextWidget({required this.label, required this.hintText});

  @override
  State<EditTextWidget> createState() => _EditTextWidgetState();
}

class _EditTextWidgetState extends State<EditTextWidget> {
  String _email = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          label: Text(widget.label),
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
          filled: true,
        ),
        onSaved: (String? emailVal) {
          _email = emailVal!;
        },
      ),
    );
  }
}
