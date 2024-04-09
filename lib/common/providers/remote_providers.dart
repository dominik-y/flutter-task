import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rolla_task/common/providers/store_providers.dart';
import 'package:rolla_task/domain/local/token_store.dart';
import 'package:rolla_task/domain/remote/apis/auth_api.dart';
import 'package:rolla_task/domain/remote/apis/product_api.dart';
import 'package:rolla_task/domain/remote/interceptors/auth_interceptors_wrapper.dart';

Future<String> refreshToken(TokenStore tokenStore, Dio dio) async {
  final response = await dio.post(
    '/auth/refresh',
    data: jsonEncode(
      {'expiresInMins': 10},
    ),
  );
  return response.data['token'];
}

final Provider<Dio> dioProvider = Provider<Dio>((ref) {
  final tokenStore = ref.watch(tokenStoreProvider);
  final dio = Dio()..options = BaseOptions(baseUrl: 'https://dummyjson.com/');

  return dio
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await tokenStore.getCurrent();
          options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 &&
              error.response?.data['name'] == 'TokenExpiredError') {
            final token = await tokenStore.getCurrent();
            if (token != null) {
              final newToken = refreshToken(tokenStore, dio);
              error.requestOptions.headers['Authorization'] =
                  'Bearer $newToken';
              return handler.resolve(
                await dio.fetch(error.requestOptions),
              );
            }
          }
          return handler.next(
            error,
          );
        },
      ),
    );
});

final authApiProvider = Provider((ref) {
  return AuthApi(
    ref.read(dioProvider),
  );
});

final productApiProvider = Provider((ref) {
  return ProductApi(
    ref.read(dioProvider),
  );
});
