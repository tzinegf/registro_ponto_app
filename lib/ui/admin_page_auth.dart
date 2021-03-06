import 'package:controle_ponto_app/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPageAuth extends StatefulWidget {
  @override
  _AdminPageAuthState createState() => _AdminPageAuthState();
}

class _AdminPageAuthState extends State<AdminPageAuth> {
  TextEditingController adminAuthController = TextEditingController();

  addStringToSF(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', s);
  }

  getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('password');
    return stringValue;
  }

  @override
  initState() {
    super.initState();
    getValuesSF().then((value){
      if(value != null ) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Icon(
              Icons.access_time_sharp,
              color: Colors.grey,
              size: 150,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
            child: Text(
              'Informe uma senha para o adminsitrador',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 50, left: 25, right: 25),
              child: TextField(
                controller: adminAuthController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              )),
          TextButton(
              onPressed: () {
                final password = adminAuthController.text;

                if (password != '' || password.isNotEmpty) {
                  addStringToSF(password);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } else {
                  showDialog(
                      context: context,
                      builder: (_) {
                        // ignore: missing_return, missing_return
                        return AlertDialog(
                          title: Text(
                            'Informe uma senha!',
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                          content: Text(
                            'N??o ?? possivel acessar o sistema de controle de ponto eletr??nico sem o cadastro de uma senha para o administrador.$password',
                            style: Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.center,
                          ),
                          actions: [],
                        );
                      });
                }
              },
              child: Text('CADASTRAR'))
        ],
      ),
    );
  }
}
