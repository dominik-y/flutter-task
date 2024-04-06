import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// HookWidget ****
class CustomAppBar extends HookWidget {
  final String label;
  Icon? appBarIcon = Icon(Icons.abc);

  CustomAppBar({
    super.key,
    required this.label,
    this.appBarIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
