import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Stream<User?> get user;

  Future<User?> get currentUser;

  Future<void> signUp(String email, String password, String name);

  Future<void> logIn(String email, String password);

  Future<void> logOut();

  Future<void> signInWithGoogle();
}
