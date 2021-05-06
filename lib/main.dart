import 'package:controle_ponto_app/ui/admin_page_auth.dart';
import 'package:controle_ponto_app/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  getValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('password');
    return stringValue;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('pt', 'BR')
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.red,
          accentColor: Colors.redAccent,

          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red,
                  minimumSize: Size(200, 50))),

          // Define the default font family.
          fontFamily: 'Square',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 30.0),
            headline2: TextStyle(fontSize: 20.0),
            headline3: TextStyle(fontSize: 20.0, color: Colors.white),
            headline4: TextStyle(fontSize: 15.0),
            headline5: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic, color: Colors.red),
            headline6: TextStyle(fontSize: 12.0, color: Colors.white),
            caption: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            subtitle2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.blue),
            bodyText1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        home: FutureBuilder(
            future: getValuesSF(),
            builder: (context, asyncSnapshot) {
              if (!asyncSnapshot.hasData) {
                return AdminPageAuth();
              } else {
                return HomeScreen();
              }
            })
        //home: CadastroFuncScreen(),
        //home: HomeScreen(),

        );
  }
}
