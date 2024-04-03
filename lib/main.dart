import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rolla_task/authentication/views/login_page.dart';
import 'package:rolla_task/home/views/home_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: LoginPage(),
      routes: {
        '/loginpage': (context) => LoginPage(),
        '/homepage': (context) => const HomePage(),
      },
    );
  }
}
