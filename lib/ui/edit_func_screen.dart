import 'package:controle_ponto_app/components/form-fields_widget.dart';
import 'package:controle_ponto_app/components/text_field_widget.dart';
import 'package:controle_ponto_app/components/timer_widget.dart';
import 'package:controle_ponto_app/models/user_model.dart';
import 'package:controle_ponto_app/providers/db_provider.dart';
import 'package:controle_ponto_app/ui/users_screen.dart';
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
  TextEditingController telefone2controller = TextEditingController();
  TextEditingController telefone1controller = TextEditingController();
  TextEditingController ruacontroller = TextEditingController();
  TextEditingController cargocontroller = TextEditingController();
  TextEditingController cidadecontroller = TextEditingController();
  TextEditingController bairrocontroller = TextEditingController();

  TextEditingController inialmococontroller = TextEditingController();
  TextEditingController fimalmococontroller = TextEditingController();
   TextEditingController iniexpdcontroller = TextEditingController();
   TextEditingController fimexpedcontroller = TextEditingController();


  bool active = false;
  int _id;
  String  _horarioInicial;
  String _fimIntervalo;
  String _inicioIntervalo;
  String _horarioFinal;
  bool _ativo;


  var cpfMask = new MaskedTextController(mask: '000.000.000-00');
  var phoneMask = new MaskedTextController(mask: '(00) 00000-0000');
  var phoneMask2 = new MaskedTextController(mask: '(00) 00000-0000');


  TimeOfDay convertTime(String time) {
    int hora = int.parse(time.substring(0, 2));
    int minut = int.parse(time.substring(3, 5));
    TimeOfDay newTime;
    return newTime = TimeOfDay(hour: hora,minute: minut);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inicioIntervalo = widget.user.horaIniAlmoco;
    _fimIntervalo = widget.user.horaFimAlmoco;
    _horarioInicial = widget.user.horaIniExpedient;
    _horarioFinal = widget.user.horaFimExpediente;
  }

  @override
  Widget build(BuildContext context) {
    nomecontroller.text = widget.user.nome;
    cpfcontroller.text = widget.user.cpf;

    phoneMask2.text = widget.user.telefone2;
    matriculacontroller.text = widget.user.codMatricula;
    phoneMask.text = widget.user.telefone1;
    ruacontroller.text = widget.user.rua;

    inialmococontroller.text =widget.user.horaIniAlmoco;
    iniexpdcontroller.text =widget.user.horaIniExpedient;
    fimexpedcontroller.text =widget.user.horaFimExpediente;
    fimalmococontroller.text =widget.user.horaFimAlmoco;

    cargocontroller.text = widget.user.cargo;
    cidadecontroller.text = widget.user.cidade;
    bairrocontroller.text = widget.user.bairro;
    _ativo = widget.user.ativo;
    _id = widget.user.id;


    GlobalKey<FormState> _form_key = new GlobalKey();


    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Funcion??rio'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => UsersScreen()));
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
                    child: Text("Dados do funcion??rio selecionado",
                        style: Theme.of(context).textTheme.headline6)),
              ),
              Form(
                key: _form_key,
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
                                      _ativo
                                          ? 'ATIVO'
                                          : 'DESATIVADO',
                                      style: _ativo
                                          ? Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                  Visibility(
                                      visible: active,
                                      child: Switch(
                                        value: this._ativo,
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
                      title: 'Informa????es principais',
                      numberOfInputs: 4,
                      activeDropDown: true,
                      oneDropDown: false,
                      child1: TextFieldWidget(
                        labelText: 'Nome:',
                        active: active,
                        textController: nomecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor insira algum nome.';
                          }
                          return null;
                        },
                      ),
                      child2: TextFieldWidget(
                          labelText: 'CPF:',
                          active:false ,
                          textController:cpfcontroller),
                      child3: TextFieldWidget(
                          labelText: 'Cargo:',
                          active: active,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor preencha este campo.';
                            }
                            return null;
                          },
                          textController: cargocontroller),


                      child4: TextFieldWidget(
                          labelText: 'Matr??cula',
                          textController: matriculacontroller,
                          active: false,
                           ),
                    ),
                    FormFieldsWidget(
                      title: 'Endere??o',
                      numberOfInputs: 3,
                      activeDropDown: true,
                      oneDropDown: false,

                      child1: TextFieldWidget(
                          labelText: 'Rua:',
                          active: active,
                          textController: ruacontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor complete este campo.';
                          }
                          return null;
                        }),
                      child2: TextFieldWidget(
                          labelText: 'Bairro:',
                          active: active,
                          textController: bairrocontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor complete este campo.';
                          }
                          return null;
                        }),
                      child3: TextFieldWidget(
                          labelText: 'Cidade:',
                          active: active,
                          textController: cidadecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor complete este campo.';
                          }
                          return null;
                        },),


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
                          active: active,
                          textController: phoneMask),
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
                          active: active,
                          textController:phoneMask2),
                    ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey),
                    left: BorderSide(color: Colors.grey),
                    right: BorderSide(color: Colors.grey),
                    top: BorderSide(color: Colors.grey)),
                borderRadius: BorderRadius.circular(10)),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 20),
                  child: Text('Expediente Seg/Sab', style: Theme.of(context).textTheme.caption)),
               TimeWidget(ativo:active,time: convertTime(_horarioInicial),label: "Hor??rio inicial",controller: iniexpdcontroller,),
                TimeWidget(ativo:active,time: convertTime(_inicioIntervalo),label: "Inicio do intervalo",controller: inialmococontroller),
                TimeWidget(ativo:active,time: convertTime(_fimIntervalo),label: "Fim do intervalo",controller: fimalmococontroller),
                TimeWidget(ativo:active,time: convertTime(_horarioFinal),label: "Hor??rio final ",controller: fimexpedcontroller),



              ],
            ),
          ),

                    Visibility(
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 30, top: 20),
                          child: TextButton(
                              onPressed: () {
                                if (_form_key.currentState.validate()) {
                                  DbProvider()
                                      .updateUser(
                                       _id,
                                      nomecontroller.text,
                                      cargocontroller.text,
                                      ruacontroller.text,
                                      bairrocontroller.text,
                                      cidadecontroller.text,
                                    fimalmococontroller.text,
                                    fimexpedcontroller.text,
                                    inialmococontroller.text,
                                    iniexpdcontroller.text,
                                      phoneMask.text,
                                      phoneMask2.text,
                                      _ativo,
                                      )
                                      .then((code) {
                                    if (code.toString() == 'ok') {
                                      Navigator.pop(context);
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => UsersScreen()));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Registro atualizado!',
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
                                }, child: Text('SALVAR'))),
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
