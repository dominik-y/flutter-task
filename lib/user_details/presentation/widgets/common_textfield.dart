import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// HookWidget ****
class CommonTextField extends HookWidget {
  final String label;

  const CommonTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 32, right: 32, top: 12),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
