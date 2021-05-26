import 'package:controle_ponto_app/models/relatorio_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class DateWidget extends StatefulWidget {
   DateTime date;
   String label;
   Relatorio relatorio;
   final FormFieldValidator validator;
   TextEditingController controller;
   Function getReports;

  DateWidget({@required this.date,this.label,@required this.controller,this.validator,this.relatorio,this.getReports});

  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {



  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child:TextFormField(
        textInputAction: TextInputAction.none,
        controller: widget.controller,
          validator:widget.validator,
          textAlign: TextAlign.center,
          onTap: ()async{
            DateTime newDate= await showDatePicker(
              firstDate: DateTime(2010,1,1),
              lastDate: DateTime.now(),

              context: context,
              initialDate:widget.date,
            );
            if(newDate != null){
              widget.getReports(widget.controller.text = '${newDate.year}-${newDate.month}-${newDate.day}');

              setState(() {
                widget.date = newDate;
                widget.controller.text = '${newDate.day}-${newDate.month}-${newDate.year}';
              });
            }

          }

      ),


    );

  }
}
