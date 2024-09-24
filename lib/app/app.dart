import 'package:chat_firebase/app/login/cubits/login/login_cubit.dart';
import 'package:chat_firebase/app/login/page/page.dart';
import 'package:chat_firebase/app/ui/navigator.dart';
import 'package:chat_firebase/app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(GlobalKey<FormState>()),
      child: MaterialApp(
        theme: AppTheme.light,
        title: 'Material App',
        routes: {
          AppNavigator.ROUTE_MAIN_PAGE: (context) => const OnboardingPage(),
          AppNavigator.ROUTE_LOG_IN: (context) => const LoginPage(),
          AppNavigator.ROUTE_SIGN_UP: (context) => const SignUpPage(),
        },
      ),
    );
  }
}
