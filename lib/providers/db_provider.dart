import 'package:controle_ponto_app/models/user_model.dart';
import 'package:dio/dio.dart';

class DbProvider {
  Response response;
  var dio = Dio();
  final url ='http://192.168.5.131:3333';

  Future<List<User>> getAllUsers() async {
    try{
      response = await dio.get('$url/users');

      return (response.data).map<User>((user) => User.fromJson(user)).toList();
    }catch(e){
      throw e;
    }

  }

  dynamic sendUser(int codMatricula, String nome,String cpf, String cargo,String rua, String bairro, String cidade, String horaFimAlmoco, String horaIniAlmoco, String horaFimExpediente, String horaIniExpediente, String telefone1, String telefone2,bool ativo ) async {
    try{
       response = await dio.post('$url/createuser', data: {'cod_matricula':codMatricula,'nome':nome,'cpf':cpf, 'cargo':cargo, 'rua':rua, 'bairro':bairro, 'cidade':cidade, 'hora_fim_almoco':horaFimAlmoco, 'hora_ini_almoco':horaIniAlmoco, 'hora_fim_expediente':horaFimExpediente, 'hora_ini_expediente':horaIniExpediente, 'telefone1':telefone1, 'telefone2':telefone2,'ativo':ativo,'id':null });
      print (response);
       return response;
    }catch(e){
      print ('teste $e.');
    }

  }
  dynamic updateUser(String nome, String cargo,String rua, String bairro, String cidade,/* String horaFimAlmoco, String horaIniAlmoco, String horaFimExpediente, String horaIniExpediente, */String telefone1, String telefone2,bool ativo ) async {
    try{
      response = await dio.post('$url/edituser/', data: {'nome':nome,'cargo':cargo, 'rua':rua, 'bairro':bairro, 'cidade':cidade,/* 'hora_fim_almoco':horaFimAlmoco, 'hora_ini_almoco':horaIniAlmoco, 'hora_fim_expediente':horaFimExpediente, 'hora_ini_expediente':horaIniExpediente,*/ 'telefone1':telefone1, 'telefone2':telefone2,'ativo':ativo,'id':null });
      print (response);
      return response;
    }catch(e){
      print ('teste $e.');
    }

  }
}
