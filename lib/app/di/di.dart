import 'package:chat_firebase/packages/authentication/domain/authentication_respository.dart';
import 'package:chat_firebase/packages/authentication/insfrastructure/authentication_repository_impl.dart';
import 'package:chat_firebase/packages/chat/domain/chat_repository.dart';
import 'package:chat_firebase/packages/chat/infrastructure/chat_repository_impl.dart';
import 'package:chat_firebase/packages/messages/domain/messages_repository.dart';
import 'package:chat_firebase/packages/messages/infrastructure/messages_repository_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// Registro de todas las dependencias que la aplicación necesita
void initDependencies() {
  getIt.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(),
  );

  getIt.registerSingleton<ChatRepository>(ChatRepositoryImpl());

  getIt.registerSingleton<MessagesRepository>(MessagesRepositoryImpl());
}
