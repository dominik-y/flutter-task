import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rolla_task/domain/remote/apis/auth_api.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio()..options = BaseOptions(baseUrl: 'https://dummyjson.com/');
});

final authApiProvider = Provider((ref) {
  return AuthApi(
    ref.read(dioProvider),
  );
});
