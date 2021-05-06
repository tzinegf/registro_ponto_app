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
  Future <List<User>> allUsers ;

  @override
   void initState() {
    // TODO: implement initState
    super.initState();
    allUsers = DbProvider().getAllUsers();
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
                  child: Text("Funcionários cadastrados: 1",
                      style: Theme.of(context).textTheme.headline6)),
            ),
            Container(
              height: 500,
              child: projecCardtWidget()
            )

          ],
        ),
      ),
    );
  }

  Widget projecCardtWidget() {

    return FutureBuilder(
      future: this.allUsers,

      builder: (context,snapshot){
        if(!snapshot.hasData ){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else if(snapshot.hasError){
         return Center(
           child:Text('Error: ${snapshot.error}' ),
         );
        }else{
          return  ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var item =snapshot.data[index];
              return Column(
                children: <Widget>[
                  GestureDetector(child: CardWidget(nome: item.nome,status: item.ativo),
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditFuncScreen(user: item,)));
                    },
                  )
                ],
              );
            },
          );
        }

      },
    );


  }
}
