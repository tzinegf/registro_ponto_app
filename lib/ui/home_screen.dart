import 'package:controle_ponto_app/componentes/dialog_widget.dart';
import 'package:controle_ponto_app/ui/cadastro_func_screen.dart';
import 'package:controle_ponto_app/ui/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:slide_digital_clock/slide_digital_clock.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userAuthController = TextEditingController();

  getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('password');
    return stringValue;
  }

//TODO
//implementar leitura do código

  String newcode = '';

  final DateTime data = DateTime.now();

  Widget _newDialog() {
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
                        child: Text('NOVO REGISTRO',
                            style: Theme.of(context).textTheme.headline3)),
                  ),
                  IconButton(
                      icon: Icon(Icons.qr_code),
                      splashColor: Colors.blue,
                      color: Colors.blue,
                      iconSize: 100,
                      onPressed: () async {
                       String code = await FlutterBarcodeScanner.scanBarcode(
                            '#ff6666', 'teste', true, ScanMode.DEFAULT);
                        Navigator.pop(context, code);
                         setState(() {
                           newcode =code;
                         });
                      }

                      ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text('LEITURA VIA CÓDIGO DE BARRAS',
                          style: Theme.of(context).textTheme.headline4)),
                  GestureDetector(
                    child: Text('Inserir código manualmente',
                        style: Theme.of(context).textTheme.headline5),
                    onTap: () {
                      Navigator.pop(context);
                      _newManualDialog();
                    },
                  )
                ],
              ),
            ),
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
                        child: Text('REGISTRO MANUAL',
                            style: Theme.of(context).textTheme.headline3)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 20, left: 20, bottom: 20),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text('INFORME O CÓDIGO',
                          style: Theme.of(context).textTheme.headline4)),
                  TextButton(onPressed: () {}, child: Text('REGISTRAR'))
                ],
              ),
            ),
          );
        });
  }
  Widget _userAuthDialog(int n) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String _information ='';
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
                        child: Text(' Módulo administrativo',
                            style: Theme.of(context).textTheme.headline3)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 20, left: 20, bottom: 20),
                    child: TextField(
                      controller: userAuthController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text('Informe a senha de administração', style: Theme.of(context).textTheme.headline4)),
                  Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(_information, style: Theme.of(context).textTheme.headline4)),
                  TextButton(onPressed: () async{
                   String password = await getValuesSF();

                    if(userAuthController.text == password){
                      _information ='';
                      userAuthController.clear();
                      Navigator.pop(context);
                      if(n==1){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroFuncScreen()));
                      }else if(n==2){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UsersScreen()));
                       }else if(n==3){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UsersScreen()));}
                    }else{
          showDialog(
          context: context,
          builder: (BuildContext context) {
           return AlertDialog(content: Text('Senha icorreta!', style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,));
          });
                    }
                  }, child: Text('ENTRAR'))
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema de ponto eletrônico'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            color: Colors.blueGrey,
            child: Center(
                child: Text(
                    DateFormat("EEEE d 'de' MMMM 'de' y", "pt_BR").format(data),
                    style: Theme.of(context).textTheme.headline6)),
          ),
          Text(
            newcode,
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: Center(
              child: Container(
                height: 120,
                width: 400,
                child: DigitalClock(
                  digitAnimationStyle: Curves.elasticOut,
                  is24HourTimeFormat: true,
                  areaDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  hourMinuteDigitTextStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 90,
                  ),
                  amPmDigitTextStyle: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Registrar Ponto',
        child: Icon(
          Icons.add,
          size: 50,
        ),
        onPressed: () {
          _newDialog();
        },
      ),
      drawer: Drawer(
          child: Container(
        color: Colors.red,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Icon(
                Icons.access_time,
                size: 150,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Divider(
                  height: 5,
                  thickness: 2,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.white,
                )),
            ListTile(
              title: Text('Novo Funcionário',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center),
              onTap: () {
                //Navigator.pop(context);
                _userAuthDialog(1);
              },
            ),
            ListTile(
              title: Text('Funcionários Cadastrados',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center),
              onTap: () {
                _userAuthDialog(2);
                // ...
              },
            ),
            ListTile(
              title: Text('Relatórios',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center),
              onTap: () {
                _userAuthDialog(3);
              },
            ),
            Padding(
                padding: EdgeInsets.only(top: 300),
                child: ListTile(
                  title: Text('Sair',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ))
          ],
        ),
      )),
    );
  }
}
