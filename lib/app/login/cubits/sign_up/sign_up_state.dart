part of 'sign_up_cubit.dart';

enum Status {
  //
  initial,
  success,
  failed,
  inProgress,
  passwordMismatch,
  passwordTooWeak,
  emailAllReadyRegistered,
}

class SignUpState {
  SignUpState({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.status = Status.initial,
  });
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final Status status;

  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    Status? status,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
    );
  }
}
