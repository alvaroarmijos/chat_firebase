part of 'login_cubit.dart';

enum Status { initial, success, failed, inProgress }

class LoginState {
  LoginState({
    this.email,
    this.password,
    this.status = Status.initial,
  });

  final String? email;
  final String? password;
  final Status status;

  LoginState copyWith({
    String? email,
    String? password,
    Status? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
