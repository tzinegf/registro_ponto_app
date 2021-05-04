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
         child: Text('Informe uma senha para o adminsitrador',style: Theme.of(context).textTheme.headline3,),
         ),
         Padding(padding: EdgeInsets.only(bottom: 50,left: 25,right:25),
           child:  TextField(
             textAlign: TextAlign.center,
    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
    ),
    )
         ),


         TextButton(onPressed: (){}, child:Text('CADASTRAR') )

       ],
     ),
    );
  }
}
