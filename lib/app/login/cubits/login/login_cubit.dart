import 'package:chat_firebase/packages/authentication/insfrastructure/authentication_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.formKey,
  ) : super(LoginState());

  final GlobalKey<FormState> formKey;

  final authenticationRepository = AuthenticationRepositoryImpl();

  void onEmailChange(String? value) {
    emit(state.copyWith(email: value));
  }

  void onPasswordChange(String? value) {
    emit(state.copyWith(password: value));
  }

  void logIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    emit(state.copyWith(status: Status.inProgress));

    // codigo para loguear al usuario
    if (state.email != null && state.password != null) {
      try {
        await authenticationRepository.logIn(state.email!, state.password!);
        emit(state.copyWith(status: Status.success));
      } catch (e) {
        emit(state.copyWith(status: Status.failed));
      }
    }
  }
}
