import 'package:controle_ponto_app/components/timer_widget.dart';
import 'package:controle_ponto_app/providers/db_provider.dart';
import 'package:gen_profile/gen_profile.dart';
import 'package:controle_ponto_app/components/form-fields_widget.dart';
import 'package:controle_ponto_app/components/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

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

  TextEditingController inialmococontroller = TextEditingController();
  TextEditingController fimalmococontroller = TextEditingController();
  TextEditingController iniexpdcontroller = TextEditingController();
  TextEditingController fimexpedcontroller = TextEditingController();

  var cpfMask = new MaskedTextController(mask: '000.000.000-00');

  var phoneMask = new MaskedTextController(mask: '(000) 00000-0000');

  var phoneMask2 = new MaskedTextController(mask: '(000) 00000-0000');

  GlobalKey<FormState> _key = new GlobalKey();

  List<String> times = [];
  List<String> states = [];

  TimeOfDay convertTime(String time) {
    int hora = int.parse(time.substring(0, 2));
    int minut = int.parse(time.substring(3, 5));
    TimeOfDay newTime;
    return newTime = TimeOfDay(hour: hora, minute: minut);
  }

  void validInputSize() {}
  FocusNode myFocusNode;

  @override
  initState() {
    super.initState();
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
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey),
                              left: BorderSide(color: Colors.grey),
                              right: BorderSide(color: Colors.grey),
                              top: BorderSide(color: Colors.grey)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 20),
                              child: Text('Expediente Seg/Sab',
                                  style: Theme.of(context).textTheme.caption)),
                          TimeWidget(
                              time: TimeOfDay(hour: 00, minute: 00),
                              label: "Horário inicial",
                              controller: iniexpdcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor complete este campo.';
                                }
                                return null;
                              }),
                          TimeWidget(
                              time: TimeOfDay(hour: 00, minute: 00),
                              label: "Inicio do intervalo",
                              controller: inialmococontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor complete este campo.';
                                }
                                return null;
                              }),
                          TimeWidget(
                              time: TimeOfDay(hour: 00, minute: 00),
                              label: "Fim do intervalo",
                              controller: fimalmococontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor complete este campo.';
                                }
                                return null;
                              }),
                          TimeWidget(
                              time: TimeOfDay(hour: 00, minute: 00),
                              label: "Horário final ",
                              controller: fimexpedcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor complete este campo.';
                                }
                                return null;
                              }),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 30, top: 20),
                        child: TextButton(
                            onPressed: () {
                              if (_key.currentState.validate()) {
                                DbProvider()
                                    .sendUser(
                                        int.parse(matriculacontroller.text),
                                        nomecontroller.text,
                                        cpfMask.text,
                                        cargocontroller.text,
                                        ruacontroller.text,
                                        bairrocontroller.text,
                                        cidadecontroller.text,
                                        fimalmococontroller.text,
                                        inialmococontroller.text,
                                        fimexpedcontroller.text,
                                        iniexpdcontroller.text,
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
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.redAccent,
                                        content: Text(
                                          'Preencha todos os campos',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                          textAlign: TextAlign.center,
                                        )));
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
