import 'package:controle_ponto_app/providers/db_provider.dart';
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
  TextEditingController nomecontroller = TextEditingController();

  TextEditingController matriculacontroller = TextEditingController();

  TextEditingController ruacontroller = TextEditingController();

  TextEditingController cargocontroller = TextEditingController();

  TextEditingController cidadecontroller = TextEditingController();

  TextEditingController bairrocontroller = TextEditingController();

  TextEditingController fimalmococontroller = TextEditingController();

  //TextEditingController estadocontroller = TextEditingController();

  var cpfMask = new MaskedTextController(mask: '000.000.000-00');

  var phoneMask = new MaskedTextController(mask: '(000) 00000-0000');

  var phoneMask2 = new MaskedTextController(mask: '(000) 00000-0000');

  GlobalKey<FormState> _key = new GlobalKey();

  String _horarioInicial;

  //String _estadoinicial;
  String _fimIntervalo;
  String _inicioIntervalo;
  String _horarioFinal;

  String convertTime(String time) {
    int horaIni = int.parse(time.substring(0, 2).replaceAll(':', ''));
    return horaIni.hours.ago.toString();
  }

  List<String> times = [];
  List<String> states = [];

  void newListTimes() {
    for (int i = 0; i <= 23; i++) {
      times.add((i.hours).toString().substring(0, 8).replaceAll('.', ''));
      /*
      for(int j=0;j<60;j++){

        times.add((i.hours+j.minutes).toString());
      }*/
    }
  }

  void validInputSize() {}
  FocusNode myFocusNode;
  @override
  initState() {
    super.initState();
    myFocusNode = FocusNode();
    newListTimes();
    states = [
      "AC",
      "AL",
      "AM",
      "AP",
      "BA",
      "CE",
      "DF",
      "ES",
      "GO",
      "MA",
      "MT",
      "MS",
      "MG",
      "PA",
      "PB",
      "PR",
      "PE",
      "PI",
      "RJ",
      "RN",
      "RO",
      "RS",
      "RR",
      "SC",
      "SE",
      "SP",
      "TO"
    ];
  }

  int newMatric = GP.login(numbers: true, size: 10);

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
                      child1: TextFieldWidget(
                          textController: nomecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor insira algum nome.';
                            }
                            return null;
                          },
                          labelText: 'Nome:'),
                      child2: TextFieldWidget(
                        labelText: 'CPF:',
                        keyboardType: TextInputType.number,
                        textController: cpfMask,
                        validator: (value) {
                          if (cpfMask.text.length != 14 || value.isEmpty) {
                            return 'Por favor complete o CPF.';
                          }
                          return null;
                        },
                      ),
                      child3: TextFieldWidget(
                        labelText: 'Cargo:',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor preencha este campo.';
                          }
                          return null;
                        },
                        textController: cargocontroller,
                      ),
                      child4: TextFieldWidget(
                        labelText: 'Matrícula',
                        textController: matriculacontroller,
                        active: false,
                      ),
                    ),
                    FormFieldsWidget(
                      title: 'Endereço',
                      numberOfInputs: 3,
                      activeDropDown: true,
                      oneDropDown: false,
                      child1: TextFieldWidget(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor complete este campo.';
                          }
                          return null;
                        },
                        labelText: 'Rua:',
                        textController: ruacontroller,
                      ),
                      child2: TextFieldWidget(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor complete este campo.';
                          }
                          return null;
                        },
                        labelText: 'Bairro:',
                        textController: bairrocontroller,
                      ),
                      child3: TextFieldWidget(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor complete este campo.';
                          }
                          return null;
                        },
                        labelText: 'Cidade:',
                        textController: cidadecontroller,
                      ),
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
                        validator: (value) {
                          if (phoneMask.text.length <= 13 || value.isEmpty) {
                            return 'Por favor informe um telefone.';
                          }
                          return null;
                        },
                        labelText: 'Telefone:',
                        keyboardType: TextInputType.number,
                        textController: phoneMask,
                      ),
                      child2: TextFieldWidget(
                        validator: (value) {
                          if (!value.isEmpty) {
                            if (phoneMask2.text.length <= 13 || value.isEmpty) {
                              return 'Por favor informe um telefone.';
                            }
                          }
                          return null;
                        },
                        labelText: 'Telefone 2:',
                        keyboardType: TextInputType.number,
                        textController: phoneMask2,
                      ),
                    ),
                    FormFieldsWidget(
                      title: 'Expediente de trabalho Seg/Sex',
                      activeDropDown: false,
                      numberOfInputs: 4,
                      oneDropDown: false,
                      dpd1: DropdownButton<String>(
                        iconSize: 0,
                        isExpanded: true,
                        focusColor: Colors.redAccent,
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
                        hint: Text("Horário Inicial",
                            style: Theme.of(context).textTheme.headline4),
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
                        items:
                            times.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          );
                        }).toList(),
                        hint: Text("Inicio do Intervalo",
                            style: Theme.of(context).textTheme.headline4),
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
                        items:
                            times.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          );
                        }).toList(),
                        hint: Text("Fim do Intervalo",
                            style: Theme.of(context).textTheme.headline4),
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
                        items:
                            times.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          );
                        }).toList(),
                        hint: Text("Horário Final",
                            style: Theme.of(context).textTheme.headline4),
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
                              if (_key.currentState.validate() && _horarioFinal !=null && _horarioInicial !=null && _fimIntervalo !=null&& _inicioIntervalo !=null) {
                                String horarioInicial =
                                    convertTime(_horarioInicial);
                                String fimIntervalo =
                                    convertTime(_fimIntervalo);
                                String inicioIntervalo =
                                    convertTime(_inicioIntervalo);
                                String horarioFinal =
                                    convertTime(_horarioFinal);

                                DbProvider()
                                    .sendUser(
                                        int.parse(matriculacontroller.text),
                                        nomecontroller.text,
                                        cpfMask.text,
                                        cargocontroller.text,
                                        ruacontroller.text,
                                        bairrocontroller.text,
                                        cidadecontroller.text,
                                        fimIntervalo,
                                        inicioIntervalo.toString(),
                                        horarioFinal,
                                        horarioInicial,
                                        phoneMask.text,
                                        phoneMask2.text,
                                        true)
                                    .then((code) {
                                  if (code.toString() == 'ok') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          'Usuário cadastrado com sucesso!',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      backgroundColor: Colors.green,
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(code.toString(),
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                });
                              }else{
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.redAccent,
                                    content: Text('Preencha todos os campos',style:Theme.of(context)
                                        .textTheme
                                        .headline3,textAlign: TextAlign.center,)));
                              }

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
