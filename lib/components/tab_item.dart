
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabItemWidget extends StatefulWidget {
  final String text;
  TabItemWidget({required this.text, Key? key}) : super(key: key);

  @override
  State<TabItemWidget> createState() => _TabItemWidgetState();
}

class _TabItemWidgetState extends State<TabItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Tab(text: widget.text);
  }
}
