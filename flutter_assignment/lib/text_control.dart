import 'package:flutter/material.dart';
import './text_output.dart';
class TextControl extends StatefulWidget {

  @override
  State<TextControl> createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  String _aText = "This is a text";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {
          setState(() {
            _aText = "Text Changed";
          });
    }, child: Text("Change Text")),
        TextOutput(_aText),
      ],
    );
  }
}
