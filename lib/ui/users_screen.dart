import 'package:controle_ponto_app/components/card_widget.dart';
import 'package:controle_ponto_app/models/user_model.dart';
import 'package:controle_ponto_app/providers/db_provider.dart';
import 'package:controle_ponto_app/ui/edit_func_screen.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> allUsers;

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
        title: Text('Funcionários'),
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
                  child: Text("Funcionários cadastrados: ${usersCount}",
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditFuncScreen(
                                user: allUsers[index],
                              )));
                },
              )
            ],
          );
        });
  }
}
