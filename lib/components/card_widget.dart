import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String nome;
  final bool status;

  CardWidget({this.nome,this.status});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            height: 90,
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Funcionário/a:',
                        style: Theme.of(context).textTheme.headline4),
                    Text(this.nome,
                        style: Theme.of(context).textTheme.headline4)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Data do cadastro',
                        style: Theme.of(context).textTheme.headline4),
                    Text('04/05/2021',
                        style: Theme.of(context).textTheme.headline4)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status',
                        style: Theme.of(context).textTheme.headline4),
                    Text(this.status?'ATIVO':'DESATIVADO', style: this.status ?Theme.of(context).textTheme.subtitle2:Theme.of(context).textTheme.bodyText1)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
