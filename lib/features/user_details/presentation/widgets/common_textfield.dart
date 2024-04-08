import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rolla_task/resources.dart';

class CommonTextField extends HookWidget {
  final String label;

  const CommonTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 12),
      child: AbsorbPointer(
        absorbing: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            color: AppColor.neutral2,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(
                color: AppColor.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
