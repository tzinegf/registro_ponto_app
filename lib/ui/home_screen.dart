import 'package:controle_ponto_app/ui/cadastro_func_screen.dart';
import 'package:controle_ponto_app/ui/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:slide_digital_clock/slide_digital_clock.dart';



class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//TODO
//implementar leitura do código

String teste='';

final DateTime data = DateTime.now();

      String newText(String teste){
        setState(() {
          teste;
        });

      }


  Widget _newDialog(String teste){
    showDialog(context: context, builder:(BuildContext context){
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
                 child: Center(child: Text('NOVO REGISTRO',style: Theme.of(context).textTheme.headline3)),
              ),
              IconButton(icon: Icon(Icons.qr_code),
                  splashColor: Colors.blue,
                  color: Colors.blue,
                  iconSize: 100,
                  onPressed: ()async{
                    teste = await FlutterBarcodeScanner.scanBarcode('#ff6666','teste',true,ScanMode.DEFAULT);
                    Navigator.pop(context,teste);

                  }),
              Padding(padding: EdgeInsets.only(bottom: 50),
              child: Text('LEITURA VIA CÓDIGO DE BARRAS',style: Theme.of(context).textTheme.headline4)),
              GestureDetector(
                child: Text('Inserir código manualmente',style: Theme.of(context).textTheme.headline5),
                onTap: (){
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
  Widget _newManualDialog(){
    showDialog(context: context, builder:(BuildContext context){
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
                child: Center(child: Text('REGISTRO MANUAL',style: Theme.of(context).textTheme.headline3)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20),
                  child: Text('INFORME O CÓDIGO',style: Theme.of(context).textTheme.headline4)),
              TextButton(onPressed: (){}, child:Text('REGISTRAR') )
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
          Container(height: 40,
          color: Colors.blueGrey,
            child: Center(child: Text(DateFormat("EEEE d 'de' MMMM 'de' y","pt_BR").format(data),style: Theme.of(context).textTheme.headline6)),
          ),
          Text(teste,style: TextStyle(fontSize: 50),),
          Expanded(
            child: Center(
              child: Container(
                height: 120,
                width: 400,

                child:  DigitalClock(
                  digitAnimationStyle: Curves.elasticOut,
                  is24HourTimeFormat: true,
                  areaDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  hourMinuteDigitTextStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 90,
                  ),
                  amPmDigitTextStyle: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
                ),),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Registrar Ponto',
        child: Icon(Icons.add,size: 50,),
        onPressed: (){
          _newDialog(teste);
        },
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
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CadastroFuncScreen()));
                },
              ),
              ListTile(

                title: Text('Funcionários Cadastrados',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersScreen()));
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


