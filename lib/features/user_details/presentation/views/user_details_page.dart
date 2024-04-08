import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rolla_task/features/authentication/providers/user_provider.dart';
import 'package:rolla_task/features/user_details/presentation/widgets/common_textfield.dart';
import 'package:rolla_task/features/user_details/presentation/widgets/sign_out_button.dart';
import 'package:rolla_task/resources.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rolla_task/util/snack_bar_util.dart';

@RoutePage()
class UserDetailsPage extends HookConsumerWidget {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? avatarUrl;
  final int? age;

  const UserDetailsPage({
    super.key,
    this.email,
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.age,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(userProvider.notifier);
    final user = ref.watch(userProvider);

    useEffect(() {
      userNotifier.getCurrentUser();
      return null;
    }, [userNotifier]);

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
            context.router.popForced();
          },
        ),
      ),
      backgroundColor: AppColor.neutral1,
      body: Center(
        child: user.when(
          data: (data) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: CircleAvatar(
                    radius: 50.0,
                    // add image after fetching here
                    backgroundImage: NetworkImage(data.image ?? ''),
                  ),
                ),
                CommonTextField(
                  label: data.firstName ?? '',
                ),
                CommonTextField(
                  label: data.lastName ?? '',
                ),
                CommonTextField(
                  label: data.username ?? '',
                ),
                CommonTextField(
                  label: data.email ?? '',
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 64, right: 16, left: 16),
                  child: SignOutButton(
                    label: 'Sign Me Out',
                    //   onPressed: () => Navigator.pushNamed(
                    //     context,
                    //     '/loginpage',
                    //     // delete token
                    //   ),
                  ),
                ),
              ],
            );
          },
          error: (error, stacktrace) {
            showSnackBar(error, context);
          },
          loading: () {
            const CircularProgressIndicator();
            return null;
          },
        ),
      ),
    );
  }
}
