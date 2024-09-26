import 'package:chat_firebase/app/auth/auth_handler.dart';
import 'package:chat_firebase/app/auth/bloc/auth_bloc.dart';
import 'package:chat_firebase/app/home/page/home_page.dart';
import 'package:chat_firebase/app/login/cubits/login/login_cubit.dart';
import 'package:chat_firebase/app/login/cubits/onboarding/onboarding_cubit.dart';
import 'package:chat_firebase/app/login/cubits/sign_up/sign_up_cubit.dart';
import 'package:chat_firebase/app/login/page/page.dart';
import 'package:chat_firebase/app/ui/navigator.dart';
import 'package:chat_firebase/app/ui/ui.dart';
import 'package:chat_firebase/app/widgets/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: AuthHandler(
        child: MaterialApp(
          theme: AppTheme.light,
          title: 'Material App',
          navigatorKey: navigatorKey,
          routes: {
            AppNavigator.ROUTE_MAIN_PAGE: (context) => const RootPage(),
            AppNavigator.ROUTE_ONBOARDING: (context) => BlocProvider(
                  create: (context) => OnboardingCubit(),
                  child: const OnboardingPage(),
                ),
            AppNavigator.ROUTE_LOG_IN: (context) => BlocProvider(
                  create: (context) => LoginCubit(GlobalKey<FormState>()),
                  child: const LoginPage(),
                ),
            AppNavigator.ROUTE_SIGN_UP: (context) => BlocProvider(
                  create: (context) => SignUpCubit(GlobalKey<FormState>()),
                  child: const SignUpPage(),
                ),
            AppNavigator.ROUTE_HOME: (context) => const HomePage(),
          },
        ),
      ),
    );
  }
}
