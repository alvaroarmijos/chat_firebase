import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_firebase/packages/authentication/domain/authentication_respository.dart';
import 'package:chat_firebase/packages/chat/domain/chat_repository.dart';
import 'package:chat_firebase/packages/chat/domain/contact.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._repository,
    this._authenticationRepository,
  ) : super(HomeState()) {
    on<GetContactsEvent>(_onGetContactsEvent);
    on<UpdateUserStatusEvent>(_onUpdateUserStatusEvent);
  }

  final ChatRepository _repository;
  final AuthenticationRepository _authenticationRepository;
  final _firebaseMessaging = FirebaseMessaging.instance;

  FutureOr<void> _onGetContactsEvent(
      GetContactsEvent event, Emitter<HomeState> emit) async {
    final user = await _authenticationRepository.currentUser;

    return emit.forEach(
      _repository.getContacts(),
      onData: (data) {
        data.removeWhere(
          (contact) => contact.id == user?.uid,
        );
        return HomeState(
          contacts: data,
        );
      },
    );
  }

  FutureOr<void> _onUpdateUserStatusEvent(
    UpdateUserStatusEvent event,
    Emitter<HomeState> emit,
  ) async {
    final user = await _authenticationRepository.currentUser;
    final token = await _firebaseMessaging.getToken();
    if (user != null) {
      await _repository.updateUserStatus(user, event.status, token: token);
    }
  }
}
