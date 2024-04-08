import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rolla_task/domain/models/user.dart';
part 'auth_api.g.dart';

//repo ne bi trebao znati za body
@RestApi()
abstract class _AuthApi {
  factory _AuthApi(Dio dio) = __AuthApi;

  @POST('/auth/login')
  Future<User> _login(@Body() Map<String, dynamic> data);

  @GET('/auth/me')
  Future<User> getCurrentUser();
}

// kako __ authapi ima baseurl u sebi
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

// @GET('/auth/products')
// Future<User> _getProducts(@Body() Map<String, dynamic> data);

// Future<User> getProducts({
//   required firstName,
//   required lastName,
//   required image,
//   required age,
//   required email,
// }) {
// }

// User info /auth/me
// "id": 15,
// "username": "kminchelle",
// "email": "kminchelle@qq.com",
// "firstName": "Jeanne",
// "lastName": "Halvorson",
// "gender": "female",
// "image": "https://robohash.org/Jeanne.png?set=set4",

// ako idu viticaste onda su named ako ne idu onda bez imena
