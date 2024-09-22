import 'package:chat_firebase/app/login/widgets/widgets.dart';
import 'package:chat_firebase/app/ui/ui.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Log in to Chateo'),
            const Text(
                'Welcome back! Sign in using your social account or email to continue us'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaButton(
                  iconPath: AppDrawables.facebookIconDrawable,
                ),
                const SizedBox(
                  width: 16,
                ),
                SocialMediaButton(
                  iconPath: AppDrawables.googleIconDrawable,
                ),
                const SizedBox(
                  width: 16,
                ),
                SocialMediaButton(
                  iconPath: AppDrawables.appleIconDrawable,
                ),
              ],
            ),
            OnboardingDivider(
              color: AppColors.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}
