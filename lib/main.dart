import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rolla_task/authentication/presentation/views/login_page.dart';
import 'package:rolla_task/home/presentation/views/home_page.dart';
import 'package:rolla_task/user_details/presentation/views/user_details_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Mozda ekstraktati myapp u app.dart
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/loginpage': (context) => LoginPage(),
        '/homepage': (context) => HomePage(
              text: '',
            ),
        '/userdetailspage': (context) => const UserDetailsPage(
            firstName: '', lastName: '', email: '', avatarUrl: '', age: 0),
      },
    );
  }
}
