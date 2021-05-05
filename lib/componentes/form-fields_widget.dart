import 'package:controle_ponto_app/componentes/text_field_widget.dart';
import 'package:flutter/material.dart';

class FormFieldsWidget extends StatelessWidget {
  final String title;
  int numberOfInputs;
  TextFieldWidget child1;

  TextFieldWidget child2;

  TextFieldWidget child3;

  TextFieldWidget child4;

  FormFieldsWidget(
      {Key,
      key,
      @required this.title,
      @required this.numberOfInputs,
      this.child1,
      this.child2,
      this.child3,
      this.child4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey),
              left: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.grey),
              top: BorderSide(color: Colors.grey)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 5, bottom: 20),
              child: Text(this.title,
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.left)),
          numberOfInputs >= 1 ? this.child1 : SizedBox(),
          numberOfInputs >= 2 ? this.child2 : SizedBox(),
          numberOfInputs >= 3 ? this.child3 : SizedBox(),
          numberOfInputs >= 4 ? this.child4 : SizedBox(),
        ],
      ),
    );
  }
}
