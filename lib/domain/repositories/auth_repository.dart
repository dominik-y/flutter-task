import 'package:rolla_task/domain/local/token_store.dart';
import 'package:rolla_task/domain/models/user.dart';
import 'package:rolla_task/domain/remote/apis/auth_api.dart';

class AuthRepository {
  final AuthApi _authApi;
  final TokenStore _tokenStore;

  AuthRepository(this._authApi, this._tokenStore);

  Future<User> login({
    required String username,
    required String password,
  }) async {
    final loginResponse = await _authApi.login(
      username: username,
      password: password,
      expiresInMins: 10,
    );
    if (loginResponse.token != null) {
      await _tokenStore.setCurrent(loginResponse.token!);
    }
    return loginResponse;
  }

  Future<String?> getCurrent() {
    return _tokenStore.getCurrent();
  }

  Future<void> clearCurrent() {
    return _tokenStore.clearCurrent();
  }

  Future<User> getCurrentUser() {
    return _authApi.getCurrentUser();
  }
}
