import 'package:controle_ponto_app/models/user_model.dart';
import 'package:dio/dio.dart';

class DbProvider{
  Response response;
  List<User> listUsers;
  var dio = Dio();
  Future<List<User>> getAllUsers()async {
    response = await dio.get('http://192.168.5.131:3333/users');
    return (response.data).map<User>((user)=> User.fromJson(user)).toList();
  }

}

