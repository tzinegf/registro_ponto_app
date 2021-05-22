import 'package:flutter/material.dart';


class MonthWidget extends StatefulWidget {
  TextEditingController controller ;

  MonthWidget(this.controller);
  @override
  _MonthWidgetState createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {

  @override
  Widget build(BuildContext context) {

    return  Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child:TextFormField(
          textInputAction: TextInputAction.none,
          controller: widget.controller,
          textAlign: TextAlign.center,
          onTap: ()async{


          }

      ),


    );

  }
}
