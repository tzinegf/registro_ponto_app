import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final bool active;
  final TextEditingController textController;

  TextFieldWidget({Key, key, @required this.labelText, this.textController,this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: TextField(
        enabled: active,
        controller: textController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: this.labelText,
        ),
      ),
    );
  }
}
