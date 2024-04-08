import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rolla_task/common/providers/remote_providers.dart';
import 'package:rolla_task/common/providers/store_providers.dart';
import 'package:rolla_task/domain/repositories/auth_repository.dart';
import 'package:rolla_task/domain/repositories/product_repository.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(
    ref.read(authApiProvider),
    ref.read(tokenStoreProvider),
  );
});

final productRepositoryProvider = Provider((ref) {
  return ProductRepository(
    ref.read(productApiProvider),
  );
});
