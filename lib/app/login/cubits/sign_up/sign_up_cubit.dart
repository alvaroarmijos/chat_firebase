import 'package:bloc/bloc.dart';
import 'package:chat_firebase/packages/authentication/domain/authentication_respository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(
    this.formKey,
    this._authenticationRepository,
  ) : super(SignUpState());

  final GlobalKey<FormState> formKey;

  final AuthenticationRepository _authenticationRepository;

  void onNameChange(String? value) {
    emit(state.copyWith(name: value));
  }

  void onEmailChange(String? value) {
    emit(state.copyWith(email: value));
  }

  void onPasswordChange(String? value) {
    emit(state.copyWith(password: value));
  }

  void onConfirmPasswordChange(String? value) {
    emit(
      state.copyWith(
        confirmPassword: value,
        status:
            value != state.password ? Status.passwordMismatch : Status.initial,
      ),
    );
  }

  void createAccount() async {
    final isValid = formKey.currentState!.validate();

    if (isValid && state.password != null && state.name != null) {
      emit(state.copyWith(status: Status.inProgress));
      // Create account
      try {
        await _authenticationRepository.signUp(
          state.email!,
          state.password!,
          state.name!,
        );
        emit(state.copyWith(status: Status.success));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(state.copyWith(status: Status.passwordTooWeak));
        } else if (e.code == 'email-already-in-use') {
          emit(state.copyWith(status: Status.emailAllReadyRegistered));
        }
      } catch (e) {
        if (!isClosed) {
          emit(state.copyWith(status: Status.failed));
        }
      }
    }
  }
}
