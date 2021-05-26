import 'package:flutter/material.dart';




class TimeWidget extends StatefulWidget {
   TimeOfDay time;
   bool ativo;
   String label;
   final FormFieldValidator validator;
   TextEditingController controller;

  TimeWidget({@required this.time,this.label,@required this.controller,this.validator,this.ativo});

  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child:TextFormField(
        textInputAction: TextInputAction.none,
        enabled: widget.ativo,
        controller: widget.controller,
          validator:widget.validator,

          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelText: widget.label,
          ),
          onTap: ()async{
            TimeOfDay newTime = await showTimePicker(
              context: context,
              initialTime: widget.time,
            );
            if(newTime != null){
              final localizations = MaterialLocalizations.of(context);
              final formattedTimeOfDay = localizations.formatTimeOfDay(newTime);
              setState(() {
                widget.time =newTime ;
                widget.controller.text= formattedTimeOfDay;
              });
            }

          }

      ),


    );

  }
}
