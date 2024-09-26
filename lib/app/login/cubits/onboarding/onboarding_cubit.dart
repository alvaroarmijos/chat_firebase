import 'package:bloc/bloc.dart';
import 'package:chat_firebase/packages/authentication/insfrastructure/authentication_repository_impl.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState());

  final repository = AuthenticationRepositoryImpl();

  void signInWithGoogle() {
    repository.signInWithGoogle();
  }
}
