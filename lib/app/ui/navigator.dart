// ignore_for_file: constant_identifier_names

import 'package:chat_firebase/packages/chat/domain/contact.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static const ROUTE_MAIN_PAGE = Navigator.defaultRouteName;
  static const ROUTE_LOG_IN = '/log-in';
  static const ROUTE_SIGN_UP = '/sign-up';
  static const ROUTE_HOME = '/home';
  static const ROUTE_ONBOARDING = '/onboarding';
  static const ROUTE_CHAT = '/chat';

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

  static void navigateToChat(BuildContext context, Contact contact) {
    Navigator.pushNamed(
      context,
      AppNavigator.ROUTE_CHAT,
      arguments: contact,
    );
  }
}
