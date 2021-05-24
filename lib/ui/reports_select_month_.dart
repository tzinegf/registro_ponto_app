
import 'package:controle_ponto_app/components/card_widget.dart';
import 'package:controle_ponto_app/models/user_model.dart';
import 'package:controle_ponto_app/providers/db_provider.dart';
import 'package:controle_ponto_app/ui/reports_month_screen.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class ReportsMonthScreen extends StatefulWidget {
  @override
  _ReportsMonthScreenState createState() => _ReportsMonthScreenState();
}

class _ReportsMonthScreenState extends State<ReportsMonthScreen> {
  List<User> allUsers;
  TextEditingController controller;

  List<User> usersFilter;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relátorio'),
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
                  child: Text("Relátorio mensal",
                      style: Theme.of(context).textTheme.headline6)),
            ),
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
            ),
            SingleChildScrollView(

              child: allUsers != null
                  ? projecCardtWidget()
                  : Container(
                height: 50,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget projecCardtWidget() {
    return ListView.builder(
      scrollDirection:  Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: usersFilter.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              GestureDetector(
                child: CardWidget(
                    nome: usersFilter[index].nome,
                    status: usersFilter[index].ativo),
                onTap: ()async {
                  showMonthPicker(
                    context: context,
                    firstDate: DateTime(DateTime.now().year - 10, 5),
                    lastDate: DateTime(DateTime.now().year,DateTime.now().month),
                    initialDate: DateTime.now(),
                    locale: Locale("pt"),
                  ).then((date) {
                    if(date != null) {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ReportMonthScreen(date,usersFilter[index].id,usersFilter[index].nome)));
                    }
                    return ;

                  });



                  /*
                  DateTime newDate= await showDatePicker(
                    initialDatePickerMode: DatePickerMode.values[0],

                    firstDate: DateTime(2010,1,1),
                    lastDate: DateTime.now(),

                    context: context,
                    initialDate:DateTime.now(),
                  );
*/
                },
              )
            ],
          );
        });
  }

  Widget _newManualDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    height: 40,
                    width: 300,
                    color: Colors.red,
                    child: Center(
                        child: Text('SELECIONE O MÊS',
                            style: Theme.of(context).textTheme.headline3)),
                  ),

                  TextButton(
                      onPressed: () async {

                      },

                      child: Text('REGISTRAR'))
                ],
              ),
            ),
          );
        });
  }
}
