import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rolla_task/features/authentication/providers/user_provider.dart';
import 'package:rolla_task/resources.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  final void Function() onLoginSuccess;
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final passwordVisibilityProvider = StateProvider<bool>((ref) => true);

  LoginPage({super.key, required this.onLoginSuccess});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = ref.watch(passwordVisibilityProvider);
    final sessionNotifier = ref.watch(userProvider.notifier);

    Future<void> handleLogin({
      required String username,
      required String password,
    }) async {
      await sessionNotifier.login(
        username: username,
        password: password,
      );
      onLoginSuccess();
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColor.neutral1,
        body: Padding(
          padding: const EdgeInsets.only(top: 128, left: 16, right: 16),
          child: Column(
            children: [
              TextField(
                controller: _userNameTextController,
                decoration: InputDecoration(
                  labelText: 'Enter username',
                  labelStyle: const TextStyle(
                    color: AppColor.neutral4,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(
                  color: AppColor.neutral4,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordTextController,
                decoration: InputDecoration(
                  labelText: 'Enter password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () => ref
                        .read(passwordVisibilityProvider.notifier)
                        .state = !isPasswordVisible,
                  ),
                  labelStyle: const TextStyle(
                    color: AppColor.neutral4,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: isPasswordVisible,
                style: const TextStyle(
                  color: AppColor.neutral4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColor.florescentGreen,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      AppColor.white,
                    ),
                  ),
                  onPressed: () {
                    handleLogin(
                      username: _userNameTextController.text,
                      password: _passwordTextController.text,
                    );
                  },
                  child: const Text('Log in'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
