import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRespository {
  Stream<User?> get user;

  Future<void> signUp(String email, String password, String name);

  Future<void> logIn(String email, String password);

  Future<void> logOut();

  Future<void> signInWithGoogle();
}
