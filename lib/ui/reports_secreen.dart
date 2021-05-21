import 'package:controle_ponto_app/components/date_widget.dart';
import 'package:controle_ponto_app/components/report_widget.dart';
import 'package:controle_ponto_app/models/relatorio_model.dart';
import 'package:controle_ponto_app/models/user_model.dart';
import 'package:controle_ponto_app/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportsScreen extends StatefulWidget {




  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {

  List<Relatorio> relatorios;
  TextEditingController controller = new TextEditingController();
  String _initialDate = DateFormat("y'-'MM'-'d", "pt_BR").format(DateTime.now());


  void getReports(String data ) {
    DbProvider().getAllRelatoryDay(data).then((value) {
      setState(() {
        relatorios = value;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getReports(_initialDate);
    controller.text =_initialDate;

  }

  /*
  List<User> usersFilter;
  List<User> allUsers;

  int usersCount = 0;

  void getUsers() {
    DbProvider().getAllUsers().then((value) {
      setState(() {
        allUsers = value;
        usersFilter = allUsers;
        usersCount=allUsers.length;
      });
    });
  }

*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatórios'),
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
                  child: Text("Relatório diario",
                      style: Theme.of(context).textTheme.headline6)),
            ),
            Column(
              children: [/*
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Entre com um nome',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                    onChanged: (value) {
                      setState(() {
                        usersFilter = allUsers
                            .where((u) => (u.nome
                            .toLowerCase()
                            .contains(value.toLowerCase())))
                            .toList();
                      });
                    },
                  ),
                ),*/
                DateWidget(date: DateTime.now(), controller: controller,getReports:getReports),
                SingleChildScrollView(

                  child: relatorios != null
                      ? ReportWidget(listRelatorios: relatorios,data:controller.text)
                      : Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),

                //TODO   implemntar relatorios
              ],
            ),
          ],
        ),
      ),
    );
  }
}
