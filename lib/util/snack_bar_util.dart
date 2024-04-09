import 'package:flutter/material.dart';

void showSnackBar(Object error, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      error.toString(),
    ),
  );
  Future.microtask(
    () => ScaffoldMessenger.of(context).showSnackBar(snackBar),
  );
}
