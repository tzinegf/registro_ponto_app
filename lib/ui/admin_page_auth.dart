import 'package:controle_ponto_app/ui/home_screen.dart';
import 'package:flutter/material.dart';
class AdminPageAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,

       children: [

         Padding(padding: EdgeInsets.only(bottom: 25),
           child: Icon(Icons.access_time_sharp,
           color: Colors.grey,
           size: 150,),
         ),
         Padding(padding: EdgeInsets.only(bottom: 20,left: 10,right: 10),
         child: Text('Informe uma senha para o adminsitrador',style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.center,),
         ),
         Padding(padding: EdgeInsets.only(bottom: 50,left: 25,right:25),
           child:  TextField(
             textAlign: TextAlign.center,
    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
    ),
    )
         ),


         TextButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

         }, child:Text('CADASTRAR') )

       ],
     ),
    );
  }
}
