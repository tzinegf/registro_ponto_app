import 'package:flutter/material.dart';
class ReportMonthScreen extends StatefulWidget {
  DateTime date;
  int id;
  ReportMonthScreen(this.date,this.id);
  @override
  _ReportMonthScreenState createState() => _ReportMonthScreenState();
}

class _ReportMonthScreenState extends State<ReportMonthScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('${widget.date.month.toString()}${widget.id}'),
      ),
    );
  }
}
