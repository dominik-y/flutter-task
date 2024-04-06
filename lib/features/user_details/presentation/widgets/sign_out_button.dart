import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// HookWidget ****
class SignOutButton extends HookWidget {
  final dynamic icon;
  final String label;
  final Function()? onPressed;

  const SignOutButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 40),
          ).merge(
            ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
          onPressed: onPressed,
          child: const Row(
            children: [
              Icon(Icons.logout),
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
