import 'package:controle_ponto_app/models/relatorio_month_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MonthWidget extends StatefulWidget {


  List<RelatorioMonth> listRelatoriosMonth;
  MonthWidget(this.listRelatoriosMonth);
  @override
  _MonthWidgetState createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {

  String  dateTime(String data){
    if(data!= null){
      final f = new DateFormat('hh:mm:ss');
      DateTime dateTime =  DateTime.tryParse(data).toLocal();
      return f.format(dateTime).toString();
    }
    return '';
  }
  String  date(String data){
    if(data!= null){
      final f = new DateFormat('dd:MM:yyyy');
      DateTime dateTime =  DateTime.tryParse(data).toLocal();
      return f.format(dateTime).toString();
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    print(widget.listRelatoriosMonth);

    return  Container(
      child: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.listRelatoriosMonth.length,
              itemBuilder: (context, index) {
                if (widget.listRelatoriosMonth.isNotEmpty && widget.listRelatoriosMonth !=null) {
                  return Container(
                    padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10) ,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,


                          children: [


                            Padding(
                                  padding: EdgeInsets.only(top: 5,bottom: 10),
                                  child:  Text(date(widget.listRelatoriosMonth[index].dataRespectiva),style: Theme.of(context).textTheme.headline2,
                                  )
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Entrada'),
                            Text( dateTime(widget.listRelatoriosMonth[index].hora_ini)),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Saida'),
                            Text( dateTime(widget.listRelatoriosMonth[index].hora_saida_intervalo)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Entrada'),
                            Text(dateTime(widget.listRelatoriosMonth[index].hora_retorno_intervalo))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Saida'),
                            Text(dateTime(widget.listRelatoriosMonth[index].hora_saida))
                          ],
                        ),
                        Divider(),
                        Padding(

                            padding: EdgeInsets.only(top: 5,bottom: 10),
                            child:  Text('1º turno',style: Theme.of(context).textTheme.caption)
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Horas trabalhadas'),
                            Text(widget.listRelatoriosMonth[index].horasTrab1Turno)
                          ],
                        ),
                        Divider(),
                        Padding(

                            padding: EdgeInsets.only(top: 5,bottom: 10),
                            child:  Text('2º turno',style: Theme.of(context).textTheme.caption)
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Horas trabalhadas'),
                            Text(widget.listRelatoriosMonth[index].horasTrab2Turno)
                          ],
                        ),
                        Divider(),
                        Padding(

                            padding: EdgeInsets.only(top: 5,bottom: 10),
                            child:  Text('Total de Horas',style: Theme.of(context).textTheme.caption)
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total'),
                            Text(widget.listRelatoriosMonth[index].horasTrabTotais)
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.black45,
                        )

                      ],
                    ),
                  );
                } else {
                  print(widget.listRelatoriosMonth[index]);
                  return Container(
                    child: Center(child: Text('Nada aqui!')),
                  );
                }
              }),
        ],
      ),
    );

  }
}
