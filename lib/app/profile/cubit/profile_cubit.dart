import 'package:chat_firebase/packages/authentication/domain/authentication_respository.dart';
import 'package:chat_firebase/packages/chat/domain/chat_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._authenticationRepository,
    this._chatRepository,
  ) : super(ProfileStateLoading()) {
    initialize();
  }

  final AuthenticationRepository _authenticationRepository;
  final ChatRepository _chatRepository;

  void initialize() async {
    final user = await _authenticationRepository.currentUser;
    if (user != null) {
      emit(ProfileStateLoggedIn(user: user));
    }
  }

  Future<void> logOut() async {
    final state = this.state;
    if (state is ProfileStateLoggedIn) {
      await _chatRepository.updateUserStatus(
        state.user,
        false,
      );

      return _authenticationRepository.logOut();
    }
  }
}
