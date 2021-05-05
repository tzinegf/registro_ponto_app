import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;

  TextFieldWidget({Key, key, @required this.labelText, this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: this.labelText,
        ),
      ),
    );
  }
}
