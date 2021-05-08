import 'package:gen_profile/gen_profile.dart';
import 'package:controle_ponto_app/components/form-fields_widget.dart';
import 'package:controle_ponto_app/components/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:time/time.dart';

class CadastroFuncScreen extends StatefulWidget {
  @override
  _CadastroFuncScreenState createState() => _CadastroFuncScreenState();
}

class _CadastroFuncScreenState extends State<CadastroFuncScreen> {
  TextEditingController cpfcontroller = TextEditingController();

  TextEditingController matriculacontroller = TextEditingController();

  TextEditingController inialmococontroller = TextEditingController();

  TextEditingController telefone2controller = TextEditingController();

  TextEditingController telefone1controller = TextEditingController();

  TextEditingController inieoexpdcontroller = TextEditingController();

  TextEditingController fimexpedcontroller = TextEditingController();

  TextEditingController ruacontroller = TextEditingController();

  TextEditingController cargocontroller = TextEditingController();

  TextEditingController cidadecontroller = TextEditingController();

  TextEditingController bairrocontroller = TextEditingController();

  TextEditingController fimalmococontroller = TextEditingController();

  TextEditingController estadocontroller = TextEditingController();


  var cpfMask = new MaskedTextController(mask: '000.000.000-00');

  var phoneMask = new MaskedTextController(mask: '(000) 00000-0000');

  var phoneMask2 = new MaskedTextController(mask: '(000) 00000-0000');

  GlobalKey<FormState> _key = new GlobalKey();

  String _horarioInicial;
  String _estadoinicial;
  String _fimIntervalo;
  String _inicioIntervalo;
  String _horarioFinal;
  List <String>times =[];
  List <String> states=[];
  void newListTimes(){
    for(int i=0; i<=23;i++){
      times.add((i.hours).toString().substring(0,8).replaceAll('.', ''));
     /*
      for(int j=0;j<60;j++){

        times.add((i.hours+j.minutes).toString());
      }*/
    }
  }
  void validInputSize(){

  }
  @override
  initState(){
    super.initState();
    newListTimes();
    states = ["AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RO", "RS", "RR", "SC", "SE", "SP", "TO"];
  }


   int newMatric = GP.login(numbers: true,size: 10);


  @override
  Widget build(BuildContext context) {
    matriculacontroller.text = newMatric.toString();
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
              Form(
                key: _key,
                child: Column(
                  children: [
                    FormFieldsWidget(
                      title: 'Informações principais',
                      numberOfInputs: 4,
                      activeDropDown: true,
                      oneDropDown: false,
                      child1: TextFieldWidget(labelText: 'Nome:'),
                      child2: TextFieldWidget(
                        labelText: 'CPF:',
                        keyboardType: TextInputType.number,
                        textController: cpfMask,
                      ),
                      child3: TextFieldWidget(labelText: 'Cargo:'),
                      child4: TextFieldWidget(labelText: 'Matrícula',textController:matriculacontroller,active: false, ),
                    ),
                    FormFieldsWidget(
                      title: 'Endereço',
                      numberOfInputs: 3,
                      activeDropDown: true,
                      oneDropDown: false,
                      child1: TextFieldWidget(labelText: 'Rua:'),
                      child2: TextFieldWidget(labelText: 'Bairro:'),
                      child3: TextFieldWidget(labelText: 'Cidade:'),
                    /* dpd5: DropdownButton<String>(

                        iconSize: 0,
                        isExpanded: false,
                        focusColor: Colors.white,
                        value: _estadoinicial,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: states.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.headline4
                            ),
                          );
                        }).toList(),
                        hint: Text("Estado",style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,),
                        onChanged: (String value) {
                          setState(() {
                            _estadoinicial=value;
                          });
                        },
                      ),*/
                    ),
                    FormFieldsWidget(
                      title: 'Contato',
                      numberOfInputs: 2,
                      activeDropDown: true,
                      oneDropDown: false,
                      child1: TextFieldWidget(
                        labelText: 'Telefone:',
                        keyboardType: TextInputType.number,
                        textController: phoneMask,
                      ),
                      child2: TextFieldWidget(
                        labelText: 'Telefone 2:',
                        keyboardType: TextInputType.number,
                        textController: phoneMask2,
                      ),
                    ),
                    FormFieldsWidget(
                      title: 'Expediente de trabalho',
                      activeDropDown: false,
                      numberOfInputs: 4,
                      oneDropDown: false,
                      dpd1: DropdownButton<String>(
                        iconSize: 0,
                        isExpanded: true,
                        focusColor: Colors.white,
                        value: _horarioInicial,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: times.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          );
                        }).toList(),
                        hint: Text("Horário Inicial",style: Theme.of(context).textTheme.headline4),
                        onChanged: (String value) {
                          setState(() {
                            _horarioInicial = value;
                          });
                        },
                      ),
                      dpd2: DropdownButton<String>(
                        iconSize: 0,
                        isExpanded: true,
                        focusColor: Colors.white,
                        value: _inicioIntervalo,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: times.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          );
                        }).toList(),
                        hint: Text("Inicio do Intervalo",style: Theme.of(context).textTheme.headline4),
                        onChanged: (String value) {
                          setState(() {
                            _inicioIntervalo = value;
                          });
                        },
                      ),
                      dpd3: DropdownButton<String>(
                        iconSize: 0,
                        isExpanded: true,
                        focusColor: Colors.white,
                        value: _fimIntervalo,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items:times.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          );
                        }).toList(),
                        hint: Text("Fim do Intervalo",style: Theme.of(context).textTheme.headline4),
                        onChanged: (String value) {
                          setState(() {
                            _fimIntervalo = value;
                          });
                        },
                      ),
                      dpd4: DropdownButton<String>(
                        iconSize: 0,
                        isExpanded: true,
                        focusColor: Colors.white,
                        value: _horarioFinal,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: times.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          );
                        }).toList(),
                        hint: Text("Horário Final",style: Theme.of(context).textTheme.headline4),
                        onChanged: (String value) {
                          setState(() {
                            _horarioFinal = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 30, top: 20),
                        child: TextButton(
                            onPressed: () {
                              newListTimes();
                              print(times);

                              //TODO implementar salvamento de usuarios
                            },
                            child: Text('CADASTRAR')))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
