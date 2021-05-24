
import 'package:controle_ponto_app/components/month_widget.dart';
import 'package:controle_ponto_app/models/relatorio_month_model.dart';
import 'package:controle_ponto_app/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportMonthScreen extends StatefulWidget {
  DateTime date;
  int id;
  String nome;
  ReportMonthScreen(this.date,this.id,this.nome);


  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportMonthScreen> {

  List<RelatorioMonth> relatoriosMonth;


  void getReportsMonth() {
    DbProvider().getAllRelatoryMonth(widget.id,'${widget.date.year}','${widget.date.month}').then((value) {
      setState(() {
        relatoriosMonth = value;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    getReportsMonth();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatório'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              color: Colors.blueGrey,
              child: Center(
                  child: Text("Relatório mensal",
                      style: Theme.of(context).textTheme.headline6)),
            ),
            Container(child:Text(widget.nome,style:Theme.of(context).textTheme.headline2,)),
            Column(
              children: [
                SingleChildScrollView(

                  child: relatoriosMonth != null && relatoriosMonth !=[]
                      ?  MonthWidget(relatoriosMonth)
                      : Center(
                      child:CircularProgressIndicator(),

                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

