import 'package:rolla_task/domain/models/user.dart';
import 'package:rolla_task/domain/remote/apis/auth_api.dart';

// cmd + e
class AuthRepository {
  final AuthApi _authApi;
  AuthRepository(this._authApi);

  Future<User> login({
    required String username,
    required String password,
  }) async {
    return await _authApi.login(
      username: username,
      password: password,
      expiresInMins: 10,
    );
  }
}
