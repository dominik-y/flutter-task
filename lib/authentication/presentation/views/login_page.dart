import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final passwordVisibilityProvider = StateProvider<bool>((ref) => true);

  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = ref.watch(passwordVisibilityProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(42, 45, 53, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 128, left: 16, right: 16),
        child: Column(
          children: [
            TextField(
              controller: _userNameTextController,
              decoration: InputDecoration(
                // mozda ektstraktat text labelText: labelText
                labelText: 'Enter username',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(169, 172, 174, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: const TextStyle(
                color: Color.fromRGBO(169, 172, 174, 1),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordTextController,
              decoration: InputDecoration(
                labelText: 'Enter password',
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => ref
                      .read(passwordVisibilityProvider.notifier)
                      .state = !isPasswordVisible,
                ),
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(169, 172, 174, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              obscureText: isPasswordVisible,
              style: const TextStyle(
                color: Color.fromRGBO(169, 172, 174, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(70, 228, 143, 1),
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                onPressed: () => (
                  Navigator.pushNamed(
                    context,
                    '/homepage',
                  ),
                ),
                child: const Text('Log in'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
