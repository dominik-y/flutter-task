import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rolla_task/user_details/presentation/views/widgets.dart';

class UserDetailsPage extends HookConsumerWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String avatarUrl;
  final int age;

  const UserDetailsPage({
    super.key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
    required this.age,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(42, 45, 53, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignOutButton(label: 'Sign Me Out'),
          ],
        ),
      ),
    );
  }
}
