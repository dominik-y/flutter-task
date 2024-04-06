import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rolla_task/features/user_details/presentation/widgets/common_textfield.dart';
import 'package:rolla_task/features/user_details/presentation/widgets/sign_out_button.dart';
import 'package:rolla_task/resources.dart';

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
      appBar: AppBar(
        title: const Text(
          'User details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColor.neutral1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          color: Colors.white, // Adjust color as needed
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      backgroundColor: AppColor.neutral1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: CircleAvatar(
                radius: 50.0,
                // add image after fetching here
                backgroundImage: NetworkImage('https://your-image-url.com'),
              ),
            ),
            const CommonTextField(
              label: "s",
            ),
            const CommonTextField(
              label: 'B',
            ),
            const CommonTextField(
              label: '',
            ),
            const CommonTextField(
              label: '',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
              child: SignOutButton(
                label: 'Sign Me Out',
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/loginpage',
                  // delete token
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
