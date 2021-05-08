import 'package:controle_ponto_app/components/form-fields_widget.dart';
import 'package:controle_ponto_app/components/text_field_widget.dart';
import 'package:controle_ponto_app/models/user_model.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';

class EditFuncScreen extends StatefulWidget {
  final User user;

  EditFuncScreen({Key key, this.user}) : super(key: key);

  @override
  _EditFuncScreenState createState() => _EditFuncScreenState();
}

class _EditFuncScreenState extends State<EditFuncScreen> {
  TextEditingController nomecontroller = TextEditingController();

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

  bool active = false;
  String _horarioInicial;
  String _fimIntervalo;
  String _inicioIntervalo;
  String _horarioFinal;
  var cpfMask = new MaskedTextController(mask: '000.000.000-00');

  var phoneMask = new MaskedTextController(mask: '(000) 00000-0000');

  var phoneMask2 = new MaskedTextController(mask: '(000) 00000-0000');

  @override
  Widget build(BuildContext context) {
    nomecontroller.text = widget.user.nome;
    cpfcontroller.text = widget.user.cpf;
    matriculacontroller.text = widget.user.codMatricula;
    inialmococontroller.text = widget.user.horaIniAlmoco;
    telefone2controller.text = widget.user.telefone2;
    telefone1controller.text = widget.user.telefone1;
    inieoexpdcontroller.text = widget.user.horaIniExpedient;
    fimexpedcontroller.text = widget.user.horaFimExpediente;
    ruacontroller.text = widget.user.rua;
    cargocontroller.text = widget.user.cargo;
    cidadecontroller.text = widget.user.cidade;
    bairrocontroller.text = widget.user.bairro;
    fimalmococontroller.text = widget.user.horaFimAlmoco;

    GlobalKey<FormState> _key = new GlobalKey();
    bool _validate = false;

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Funcionário'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
              icon: !active ? Icon(Icons.edit) : Icon(Icons.close),
              onPressed: () {
                if (active) {
                  setState(() {
                    active = false;
                  });
                } else {
                  setState(() {
                    active = true;
                  });
                }
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                color: Colors.blueGrey,
                child: Center(
                    child: Text("Dados do funcionário selecionado",
                        style: Theme.of(context).textTheme.headline6)),
              ),
              Form(
                key: _key,
                child: Column(
                  children: [
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
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Status:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                  Text(
                                      widget.user.ativo
                                          ? 'ATIVO'
                                          : 'DESATIVADO',
                                      style: widget.user.ativo
                                          ? Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                  Visibility(
                                      visible: active,
                                      child: Switch(
                                        value: this.widget.user.ativo,
                                        onChanged: (value) {
                                          setState(() {
                                            this.widget.user.ativo = value;
                                          });
                                        },
                                        activeTrackColor: Colors.blueAccent,
                                        activeColor: Colors.white,
                                        inactiveTrackColor: Colors.red,
                                        inactiveThumbColor: Colors.white,
                                      ))
                                ],
                              )),
                        ],
                      ),
                    ),
                    FormFieldsWidget(
                      title: 'Informações principais',
                      numberOfInputs: 4,
                      activeDropDown: true,
                      oneDropDown: false,
                      child1: TextFieldWidget(
                        labelText: 'Nome:',
                        active: active,
                        textController: nomecontroller,
                      ),
                      child2: TextFieldWidget(
                          labelText: 'CPF:',
                          active: active,
                          textController:active? cpfMask:cpfcontroller),
                      child3: TextFieldWidget(
                          labelText: 'Cargo:',
                          active: active,
                          textController: cargocontroller),
                      child4: TextFieldWidget(
                          labelText: 'Matrícula',
                          active: active,
                          textController: matriculacontroller),
                    ),
                    FormFieldsWidget(
                      title: 'Endereço',
                      numberOfInputs: 3,
                      activeDropDown: true,
                      oneDropDown: false,
                      child1: TextFieldWidget(
                          labelText: 'Rua:',
                          active: active,
                          textController: ruacontroller),
                      child2: TextFieldWidget(
                          labelText: 'Bairro:',
                          active: active,
                          textController: bairrocontroller),
                      child3: TextFieldWidget(
                          labelText: 'Cidade:',
                          active: active,
                          textController: cidadecontroller),


                    ),
                    FormFieldsWidget(
                      title: 'Contato',
                      numberOfInputs: 2,
                      activeDropDown: true,
                      oneDropDown: false,
                      child1: TextFieldWidget(
                          labelText: 'Telefone:',
                          active: active,
                          textController: active? phoneMask:telefone1controller),
                      child2: TextFieldWidget(
                          labelText: 'Telefone 2:',
                          active: active,
                          textController: active? phoneMask2:telefone2controller),
                    ),
                    Visibility(
                      visible: active,
                      child: FormFieldsWidget(
                        title: 'Expediente de trabalho',
                        activeDropDown: false,
                        numberOfInputs: 4,
                        dpd1: DropdownButton<String>(
                          iconSize: 0,
                          isExpanded: true,
                          focusColor: Colors.white,
                          value: _horarioInicial,
                          items: <String>[
                            '00:00',
                            '01:00',
                            '02:00',
                            '03:00',
                            '04:00',
                            '05:00',
                            '06:00',
                            '07:00',
                            '08:00',
                            '09:00',
                            '10:00',
                            '11:00',
                            '12:00',
                            '13:00',
                            '14:00',
                            '15:00',
                            '16:00',
                            '17:00',
                            '18:00',
                            '19:00',
                            '20:00',
                            '21:00',
                            '22:00',
                            '23:00',
                          ].map<DropdownMenuItem<String>>((String value) {
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
                          items: <String>[
                            '00:00',
                            '01:00',
                            '02:00',
                            '03:00',
                            '04:00',
                            '05:00',
                            '06:00',
                            '07:00',
                            '08:00',
                            '09:00',
                            '10:00',
                            '11:00',
                            '12:00',
                            '13:00',
                            '14:00',
                            '15:00',
                            '16:00',
                            '17:00',
                            '18:00',
                            '19:00',
                            '20:00',
                            '21:00',
                            '22:00',
                            '23:00',
                          ].map<DropdownMenuItem<String>>((String value) {
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
                          items: <String>[
                            '00:00',
                            '01:00',
                            '02:00',
                            '03:00',
                            '04:00',
                            '05:00',
                            '06:00',
                            '07:00',
                            '08:00',
                            '09:00',
                            '10:00',
                            '11:00',
                            '12:00',
                            '13:00',
                            '14:00',
                            '15:00',
                            '16:00',
                            '17:00',
                            '18:00',
                            '19:00',
                            '20:00',
                            '21:00',
                            '22:00',
                            '23:00',
                          ].map<DropdownMenuItem<String>>((String value) {
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
                          items: <String>[
                            '00:00',
                            '01:00',
                            '02:00',
                            '03:00',
                            '04:00',
                            '05:00',
                            '06:00',
                            '07:00',
                            '08:00',
                            '09:00',
                            '10:00',
                            '11:00',
                            '12:00',
                            '13:00',
                            '14:00',
                            '15:00',
                            '16:00',
                            '17:00',
                            '18:00',
                            '19:00',
                            '20:00',
                            '21:00',
                            '22:00',
                            '23:00',
                          ].map<DropdownMenuItem<String>>((String value) {
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
                    ),
                    Visibility(
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 30, top: 20),
                          child: TextButton(
                              onPressed: () {}, child: Text('SALVAR'))),
                      visible: active,
                    )
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
