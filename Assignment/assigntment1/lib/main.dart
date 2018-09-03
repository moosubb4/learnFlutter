import 'package:flutter/material.dart';
import './text_ctrl.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.cyan,
          accentColor: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AssigntMent1'),
        ),
        body: TextCtrl(),
      ),
    );
  }
}
