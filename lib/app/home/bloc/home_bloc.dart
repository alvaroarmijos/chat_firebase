import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_firebase/packages/chat/domain/contact.dart';
import 'package:chat_firebase/packages/chat/infrastructure/chat_repository_impl.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetContactsEvent>(_onGetContactsEvent);
  }

  FutureOr<void> _onGetContactsEvent(
      GetContactsEvent event, Emitter<HomeState> emit) {
    final repository = ChatRepositoryImpl();

    return emit.forEach(
      repository.getContacts(),
      onData: (data) {
        return HomeState(
          contacts: data,
        );
      },
    );
  }
}
