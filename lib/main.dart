import 'package:chat_firebase/app/login/login.dart';
import 'package:chat_firebase/app/ui/ui.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      title: 'Material App',
      home: const OnboardingPage(),
    );
  }
}
