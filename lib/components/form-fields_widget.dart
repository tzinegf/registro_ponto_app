import 'package:controle_ponto_app/components/text_field_widget.dart';
import 'package:flutter/material.dart';

class FormFieldsWidget extends StatelessWidget  {
  final String title;
  int numberOfInputs;
  bool activeDropDown;
  bool oneDropDown;
  TextFieldWidget child1;

  TextFieldWidget child2;

  TextFieldWidget child3;

  TextFieldWidget child4;

  DropdownButton dpd1;
  DropdownButton dpd2;
  DropdownButton dpd3;
  DropdownButton dpd4;
  DropdownButton dpd5;

  FormFieldsWidget(
      {Key,
      key,
      @required this.title,
      @required this.numberOfInputs,
        @required this.activeDropDown,
        this.oneDropDown,
      this.child1,
      this.child2,
      this.child3,
      this.child4,
      this.dpd1,
      this.dpd2,
      this.dpd3,
      this.dpd4,
      this.dpd5

      })
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
      child: activeDropDown?Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Padding(
            padding: EdgeInsets.only(top: 5, bottom: 20),
            child: Text(this.title,
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.left)),
          numberOfInputs >= 1 ? this.child1 : SizedBox(),
          numberOfInputs >= 2 ? this.child2 : SizedBox(),
          numberOfInputs >= 3 ? this.child3 : SizedBox(),
          numberOfInputs >= 4 ? this.child4 : SizedBox(),
          oneDropDown?this.dpd5:SizedBox(),
        ],
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Padding(
            padding: EdgeInsets.only(top: 5, bottom: 20),
            child: Text(this.title,
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.left)),
          numberOfInputs >= 1 ? this.dpd1 : SizedBox(),
          numberOfInputs >= 2 ? this.dpd2 : SizedBox(),
          numberOfInputs >= 3 ? this.dpd3 : SizedBox(),
          numberOfInputs >= 4 ? this.dpd4 : SizedBox(),
        ],

      ),
    );
  }
}
