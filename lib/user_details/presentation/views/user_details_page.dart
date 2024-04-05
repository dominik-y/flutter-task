import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rolla_task/user_details/presentation/widgets/common_textfield.dart';
import 'package:rolla_task/user_details/presentation/widgets/sign_out_button.dart';

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
    return const Scaffold(
      backgroundColor: Color.fromRGBO(42, 45, 53, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CircleAvatar(
                radius: 50.0,
                // add image after fetching here
                backgroundImage: NetworkImage('https://your-image-url.com'),
              ),
            ),
            CommonTextField(
              label: 'some text A',
            ),
            CommonTextField(
              label: 'BBBBBB',
            ),
            CommonTextField(
              label: '',
            ),
            CommonTextField(
              label: '',
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0, right: 16, left: 16),
              child: SignOutButton(label: 'Sign Me Out'),
            ),
          ],
        ),
      ),
    );
  }
}
