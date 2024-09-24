import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.formKey,
  ) : super(LoginState());

  final GlobalKey<FormState> formKey;

  void onEmailChange(String? value) {
    emit(state.copyWith(email: value));
  }

  void onPasswordChange(String? value) {
    emit(state.copyWith(password: value));
  }

  void logIn() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
  }
}
