import 'package:flutter/material.dart';
import 'package:p3_login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.teal)),
      home: const LoginPage(),
    );
  }
}
