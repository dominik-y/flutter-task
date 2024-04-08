import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rolla_task/domain/local/token_store.dart';

class AuthInterceptorsWrapper extends InterceptorsWrapper {
  final TokenStore tokenStore;

  AuthInterceptorsWrapper({
    required this.tokenStore,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await tokenStore.getCurrent();
    print(token);
    if (token != null) {
      options.headers.addAll(
        {HttpHeaders.authorizationHeader: token},
      );
    }
    return handler.next(options);
  }
}
