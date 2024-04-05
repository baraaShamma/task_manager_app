import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager_app/link_api.dart';
import 'package:task_manager_app/resources/error/exceptions.dart';

abstract class LoginRemote {

  Future<Unit> login(String email ,String password);
}


class LoginRemoteImpl implements LoginRemote {
  final http.Client client;

  LoginRemoteImpl({required this.client});

  @override
  Future<Unit> login(String email ,String password) async {
    final body = {
      "email": email,
      "password": password,
    };

    final response =
    await client.post(Uri.parse(AppLink.login), body: body);

    if (response.statusCode == 200||response.statusCode == 201) {
      return Future.value(unit);
    }
    else if(response.statusCode == 401){
      throw WrongDataFailureException();
    }
    else {
      throw ServerException();
    }
  }

}
