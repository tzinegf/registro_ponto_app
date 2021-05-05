import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DialogWidget extends StatelessWidget {
  TextEditingController controller;
  String title;
  String text;
  String textButton;
  Widget route;

  DialogWidget({this.controller,@required this.route,this.title,this.text,this.textButton});

  getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('password');
    return stringValue;
  }

  @override
  Widget build(BuildContext context) {
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
                        controller: controller,
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

                      if(controller.text == password){
                        _information ='';
                        controller.clear();
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => route));
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

}
