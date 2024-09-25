// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static const ROUTE_MAIN_PAGE = Navigator.defaultRouteName;
  static const ROUTE_LOG_IN = '/log-in';
  static const ROUTE_SIGN_UP = '/sign-up';
  static const ROUTE_HOME = '/home';

  static void navigateToLogin(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppNavigator.ROUTE_LOG_IN,
    );
  }

  static void navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppNavigator.ROUTE_SIGN_UP,
    );
  }
}
