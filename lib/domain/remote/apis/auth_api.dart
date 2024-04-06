import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';
import 'package:rolla_task/domain/models/user.dart';
part 'auth_api.g.dart';

@RestApi()
abstract class _AuthApi {
  factory _AuthApi(Dio dio) = __AuthApi;

  @POST('/auth/login')
  Future<User> _login(@Body() Map<String, dynamic> data);
}

// repo ne bi trebao znati body
class AuthApi extends __AuthApi {
  AuthApi(Dio dio) : super(dio);

  Future<User> login({
    required String username,
    required String password,
    int? expiresInMins,
  }) {
    return _login({
      'username': username,
      'password': password,
      'expiresInMins': expiresInMins,
    });
  }
}

/*required String username,
required String password,
int? expiresInMins,*/

// ako idu viticaste onda su named ako ne idu onda bez imena
