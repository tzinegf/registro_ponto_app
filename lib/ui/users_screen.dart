import 'package:controle_ponto_app/ui/edit_func_screen.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Funcionários'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 40,
              color: Colors.blueGrey,
              child: Center(child: Text("Funcionários cadastrados: 1",style: Theme.of(context).textTheme.headline6)),
            ),
            Column(
              children: [
                GestureDetector(
                  child: Card(
                    child: Container(
                      height: 90,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Funcionário/a:',style:Theme.of(context).textTheme.headline4),
                              Text('Maria Josefina da costa',style:Theme.of(context).textTheme.headline4)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Data do cadastro',style:Theme.of(context).textTheme.headline4),
                              Text('04/05/2021',style:Theme.of(context).textTheme.headline4)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Status',style:Theme.of(context).textTheme.headline4),

                              Text('ATIVO',style:Theme.of(context).textTheme.subtitle2)
                            ],
                          )
                        ],
                      ),
                    ),

                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditFuncScreen()));
                  },
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}
