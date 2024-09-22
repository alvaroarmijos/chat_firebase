import 'package:chat_firebase/app/login/page/onboarding_page.dart';
import 'package:chat_firebase/app/ui/ui.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      title: 'Material App',
      home: const OnboardingPage(),
    );
  }
}
