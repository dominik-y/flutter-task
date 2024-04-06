import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rolla_task/resources.dart';

class CustomAppBar extends HookWidget {
  final String label;
  final Widget? userIcon;
  final VoidCallback? onUserIconPressed;

  String? title;
  String? userAvatar;
  void onPressed;

  CustomAppBar(
      {super.key, required this.label, this.userIcon, this.onUserIconPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.neutral1,
      title: Text(
        '$title',
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        userAvatar != null
            ? IconButton(
                icon: const Icon(Icons.account_circle),
                color: Colors.white,
                onPressed: () => (),
              )
            : CircleAvatar(
                backgroundImage: NetworkImage(userAvatar!), // ! wrapper fix it
                backgroundColor: AppColor.white,
              ),
      ],
    );
  }
}

// Navigator.pushNamed(
//   context,
//   '/userdetailspage',
// ),
