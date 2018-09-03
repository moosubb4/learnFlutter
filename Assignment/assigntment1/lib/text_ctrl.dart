import 'package:flutter/material.dart';
import './text_output.dart';

class TextCtrl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextCtrlState();
  }
}

class _TextCtrlState extends State<TextCtrl> {
  String _text = 'is MaApp ??';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text('Change!'),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              _text = 'This is truely MyApp';
            });
          },
        ),
        TextOutput(_text)
      ],
    );
  }
}
