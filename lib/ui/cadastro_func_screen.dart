import 'package:controle_ponto_app/components/form-fields_widget.dart';
import 'package:controle_ponto_app/components/text_field_widget.dart';
import 'package:flutter/material.dart';

class CadastroFuncScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Novo Funcionário'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                color: Colors.blueGrey,
                child: Center(
                    child: Text("Informe os dados para cadatro",
                        style: Theme.of(context).textTheme.headline6)),
              ),
              Column(
                children: [
                  FormFieldsWidget(
                    title: 'Informações principais',
                    numberOfInputs: 4,
                    child1: TextFieldWidget(labelText: 'Nome:'),
                    child2: TextFieldWidget(labelText: 'CPF:'),
                    child3: TextFieldWidget(labelText: 'Cargo:'),
                    child4: TextFieldWidget(labelText: 'Matrícula'),
                  ),
                  FormFieldsWidget(
                    title: 'Endereço',
                    numberOfInputs: 4,
                    child1: TextFieldWidget(labelText: 'Rua:'),
                    child2: TextFieldWidget(labelText: 'Bairro:'),
                    child3: TextFieldWidget(labelText: 'Cidade:'),
                    child4: TextFieldWidget(labelText: 'Estado:'),
                  ),
                  FormFieldsWidget(
                    title: 'Contato',
                    numberOfInputs: 2,
                    child1: TextFieldWidget(labelText: 'Telefone:'),
                    child2: TextFieldWidget(labelText: 'Telefone 2:'),
                  ),
                  FormFieldsWidget(
                    title: 'Expediente de trabalho',
                    numberOfInputs: 4,
                    child1: TextFieldWidget(labelText: 'Horário inicial:'),
                    child2: TextFieldWidget(labelText: 'Inicio do intervalo:'),
                    child3: TextFieldWidget(labelText: 'Fim do intervalo:'),
                    child4: TextFieldWidget(labelText: 'Horário final:'),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 30, top: 20),
                      child: TextButton(
                          onPressed: () {

                            //TODO implementar salvamento de usuarios

                          }, child: Text('CADASTRAR')))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
