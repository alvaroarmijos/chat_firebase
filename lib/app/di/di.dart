import 'package:chat_firebase/packages/authentication/domain/authentication_respository.dart';
import 'package:chat_firebase/packages/authentication/insfrastructure/authentication_repository_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// Registro de todas las dependencias que la aplicación necesita
void initDependencies() {
  getIt.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(),
  );
}
