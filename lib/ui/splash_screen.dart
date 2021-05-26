import 'package:controle_ponto_app/ui/admin_page_auth.dart';
import 'package:controle_ponto_app/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Artboard _riveArtboard;
  RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminPageAuth()));
    });
  }
  void _loadRiveFile(){
     rootBundle.load('assets/resolve_animation.riv').then((value)async {
      final file = RiveFile.import(value);
      final riverArtboard =file.mainArtboard;
       riverArtboard.addController(_controller = SimpleAnimation('anim1'));
      setState(() {
        _riveArtboard =riverArtboard;
      });

    });



  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        height: double.infinity,
        child: Center(
          child: Container(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.white,
              child: _riveArtboard != null? Rive(artboard: _riveArtboard,fit: BoxFit.cover,):Container()
            ),
          ),
        ),
      ),
    );
  }
}
