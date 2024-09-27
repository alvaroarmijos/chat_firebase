import 'package:bloc/bloc.dart';
import 'package:chat_firebase/packages/authentication/domain/authentication_respository.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(
    this._authenticationRepository,
  ) : super(OnboardingState());

  final AuthenticationRepository _authenticationRepository;

  void signInWithGoogle() {
    _authenticationRepository.signInWithGoogle();
  }
}
