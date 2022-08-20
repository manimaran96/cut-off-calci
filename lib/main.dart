import 'package:cut_off_calci/components/tab_item.dart';
import 'package:cut_off_calci/utils/app_constants.dart';
import 'package:flutter/material.dart';

import 'input_fields/input_fileds_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cut Off Calci',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cut Off Calci - Cut Off Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              TabItemWidget(text: "Engineering",),
              TabItemWidget(text: "Medical(Maths Science)",),
              TabItemWidget(text: "Medical(Pure Science)",),
              TabItemWidget(text: "Agriculture",),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            InputFieldsPage(type: CalculationType.Engineering),
            InputFieldsPage(type: CalculationType.Medical_Maths_Science),
            InputFieldsPage(type: CalculationType.Medical_Pure_Science),
            InputFieldsPage(type: CalculationType.Agriculture),
          ],
        ),
      ),
    );
  }
}
