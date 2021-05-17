
import 'package:controle_ponto_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportWidget extends StatefulWidget {
  final int itemCount;
  final bool mes;
  List<User> listUsers;

  ReportWidget({this.itemCount,this.listUsers,this.mes});



  @override
  _ReportWidgetState createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  final DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.mes?Text('Maio 2021',style: Theme.of(context).textTheme.headline2):Container()],
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10) ,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,



                        children: [

                         Padding(

                             padding: EdgeInsets.only(top: 5,bottom: 10),
                         child:  Text(
                             DateFormat("EEEE d ", "pt_BR").format(data),style: Theme.of(context).textTheme.caption)
                         ),  Padding(padding: EdgeInsets.only(top: 5,bottom: 10),
                         child:  Text('4 Registros ',style: Theme.of(context).textTheme.caption),
                         )

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Entrada'),
                          Text('08:00 ')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Saida'),
                          Text('12:00 ')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Entrada'),
                          Text('14:00 ')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Saida'),
                          Text('18:00 ')
                        ],
                      ),





                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
