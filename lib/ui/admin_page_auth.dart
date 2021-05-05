import 'package:controle_ponto_app/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPageAuth extends StatelessWidget {
  TextEditingController adminAuthController = TextEditingController();

  addStringToSF(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', s);
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
                            'Não é possivel acessar o sistema de controle de ponto eletrônico sem o cadastro de uma senha para o administrador.$password',
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
