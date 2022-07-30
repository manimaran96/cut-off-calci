import 'package:cut_off_calci/components/button.dart';
import 'package:flutter/material.dart';

import 'components/edit_text.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
              EditTextWidget(label: "Biology", hintText: "Enter your biology mark"),
              EditTextWidget(label: "Chemistry", hintText: "Enter your chemistry mark"),
              EditTextWidget(label: "Physics", hintText: "Enter your physics mark"),
              EditTextWidget(label: "Maths", hintText: "Enter your maths mark"),
              ButtonWidget()
            ],
        ),
      ),
    );
  }
}
