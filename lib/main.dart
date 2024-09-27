import 'package:chat_firebase/app/app.dart';
import 'package:chat_firebase/app/di/di.dart';
import 'package:chat_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initDependencies();
  runApp(const App());
}
