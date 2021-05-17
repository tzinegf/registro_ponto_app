import 'package:controle_ponto_app/components/report_widget.dart';
import 'package:controle_ponto_app/models/user_model.dart';
import 'package:controle_ponto_app/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {/*
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
                  child: Text("Relatórios diarios e mensais",
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
                ReportWidget( mes: true,),
                ReportWidget(mes: false,),

                //TODO   implemntar relatorios
              ],
            ),
          ],
        ),
      ),
    );
  }
}
