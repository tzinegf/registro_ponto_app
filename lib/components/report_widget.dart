
import 'package:controle_ponto_app/models/relatorio_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ReportWidget extends StatefulWidget {
  List<Relatorio> listRelatorios;
  String data;

  ReportWidget({this.listRelatorios,this.data});



  @override
  _ReportWidgetState createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {

  String  dateTime(String data){
    if(data!= null){
      final f = new DateFormat('hh:mm:ss');
      DateTime dateTime =  DateTime.tryParse(data).toLocal();
      return f.format(dateTime).toString();
    }
    return '';


  }



  @override
  Widget build(BuildContext context) {


    return Container(
      child: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.listRelatorios.length,
              itemBuilder: (context, index) {

                if (widget.listRelatorios[index].existeRegistroPonto ==1) {
                  return Container(
                  padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10) ,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,


                        children: [

                         Padding(

                             padding: EdgeInsets.only(top: 5,bottom: 10),
                         child:  Text(widget.listRelatorios[index].nome,style: Theme.of(context).textTheme.headline2)
                         ),
                          Padding(

                              padding: EdgeInsets.only(top: 5,bottom: 10),
                              child: widget.listRelatorios[index].usuarioAtivo==1? Text('ATIVO',style: Theme.of(context).textTheme.subtitle2):
                              Text('DESATIVADO',style: Theme.of(context).textTheme.bodyText1)
                          )

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Entrada (1º turno)'),
                          Text( dateTime(widget.listRelatorios[index].hora_ini)),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Saida (1º turno)'),
                          Text( dateTime(widget.listRelatorios[index].hora_saida_intervalo)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Entrada (2º turno)'),
                          Text(dateTime(widget.listRelatorios[index].hora_retorno_intervalo))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Saida (2º turno)'),
                          Text(dateTime(widget.listRelatorios[index].hora_saida))
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
                          Text(widget.listRelatorios[index].horasTrab1Turno)
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
                          Text(widget.listRelatorios[index].horasTrab2Turno)
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
                          Text('Total',style: TextStyle(fontWeight: FontWeight.bold),),
                          widget.listRelatorios[index].horasTrabTotais!=null?Text(widget.listRelatorios[index].horasTrabTotais,style: TextStyle(fontWeight: FontWeight.bold)):Text('')
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
                  return Container(
                    padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10) ,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,


                          children: [

                            Padding(

                                padding: EdgeInsets.only(top: 5,bottom: 10),
                                child:  Text(widget.listRelatorios[index].nome,style: Theme.of(context).textTheme.headline2)
                            ),
                            Padding(

                                padding: EdgeInsets.only(top: 5,bottom: 10),
                                child: widget.listRelatorios[index].usuarioAtivo==1? Text('ATIVO',style: Theme.of(context).textTheme.subtitle2):
                                Text('DESATIVADO',style: Theme.of(context).textTheme.bodyText1)
                            )

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Entrada'),
                            Text( 'Sem registro nessa data',style:Theme.of(context).textTheme.bodyText1),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Saida'),
                            Text( 'Sem registro nessa data',style:Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Entrada'),
                            Text( 'Sem registro nessa data',style:Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Saida'),
                            Text( 'Sem registro nessa data',style:Theme.of(context).textTheme.bodyText1),
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
                            Text( 'Sem registro nessa data',style:Theme.of(context).textTheme.bodyText1),
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
                            Text( 'Sem registro nessa data',style:Theme.of(context).textTheme.bodyText1),
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
                            Text( 'Sem registro nessa data',style:Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.black45,
                        )

                      ],
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
