import 'package:client/src/environment/environment.dart';
import 'package:client/src/models/user.dart';
import 'package:get/get.dart';

class UsersProvider extends GetConnect {
  String url = '${Environment.API_URL}/api/v1/users';

  Future<Response> create(User user) async {
    Response response = await post('$url/register', user.toJson(),
        headers: {'Content-Type': 'application/json'});

    return response;
  }
}
