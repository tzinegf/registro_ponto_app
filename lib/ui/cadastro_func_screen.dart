import 'package:flutter/material.dart';

class CadastroFuncScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Funcionário'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 40,
              color: Colors.blueGrey,
              child: Center(child: Text("Informe os dados para cadatro",style: Theme.of(context).textTheme.headline6)),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey),left: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey),top: BorderSide(color: Colors.grey)),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 5,bottom: 20),
                    child:
                    Text('Informações principais',style: Theme.of(context).textTheme.caption,textAlign: TextAlign.left)),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Nome:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'CPF:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Cargo:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Matricula:',
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey),left: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey),top: BorderSide(color: Colors.grey)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 5,bottom: 20),
                          child:
                          Text('Endereço',style: Theme.of(context).textTheme.caption,textAlign: TextAlign.left)),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Rua:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Bairro:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Cidade:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Estado:',
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey),left: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey),top: BorderSide(color: Colors.grey)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 5,bottom: 20),
                          child:
                          Text('Contato',style: Theme.of(context).textTheme.caption,textAlign: TextAlign.left)),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Telefone:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Telefone extra:',
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey),left: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey),top: BorderSide(color: Colors.grey)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 5,bottom: 20),
                          child:
                          Text('Expediente de trabalho',style: Theme.of(context).textTheme.caption,textAlign: TextAlign.left)),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Horário inicial:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Inicio do intervalo:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Fim do intervalo:',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,bottom: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Horário final:',
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                
              ],
            ),


          ],
        ),
      ),
      drawer: Drawer(
          child: Container(
            color: Colors.red,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Icon(Icons.access_time,size: 150,color: Colors.white,),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 50),child:
                Divider(
                  height: 5,
                  thickness: 2,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.white,
                )),
                ListTile(
                  title: Text('Novo Funcionário',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center),
                  onTap: () {
                  },
                ),
                ListTile(

                  title: Text('Funcionários Cadastrados',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(

                  title: Text('Relatórios',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 300),
                    child: ListTile(

                      title: Text('Sair',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ))
              ],
            ),
          )
      ),
    );
  }
}
