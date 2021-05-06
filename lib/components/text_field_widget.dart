import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final bool active;
  TextInputType keyboardType;
  final FormFieldValidator validator;
  final List<TextInputFormatter> formater;
  final TextEditingController textController;

  TextFieldWidget({Key, key, @required this.labelText, this.textController,this.active,this.formater,this.validator,this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        inputFormatters:formater,
        enabled: active,
        textAlign: TextAlign.center,
        controller: textController,
        decoration: InputDecoration(
          labelText: this.labelText,
        ),
        onSaved: (value){

        },
      ),
    );
  }
}
