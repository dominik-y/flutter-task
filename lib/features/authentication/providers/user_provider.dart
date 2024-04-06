import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rolla_task/common/providers/repository_provider.dart';
import 'package:rolla_task/domain/models/user.dart';
import 'package:rolla_task/domain/repositories/auth_repository.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<User>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return UserNotifier(authRepository);
});

class UserNotifier extends StateNotifier<AsyncValue<User>> {
  final AuthRepository authRepository;
  UserNotifier(this.authRepository) : super(const AsyncValue.loading());

  bool isAuthenticated() {
    return state.value?.token != null;
  }

  Future<AsyncValue<User>> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    return state = await AsyncValue.guard(
      () => authRepository.login(
        username: username,
        password: password,
      ),
    );
  }
}
