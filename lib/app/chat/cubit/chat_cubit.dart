import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_firebase/packages/messages/domain/message.dart';
import 'package:chat_firebase/packages/messages/domain/messages_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._messagesRepository) : super(ChatState());

  final MessagesRepository _messagesRepository;

  StreamSubscription? _streamSubscription;

  void sendMessage(
    String message,
    String contactId,
    String userId,
  ) {
    final date = DateTime.now().toIso8601String();

    _messagesRepository.sendMessage(
      _generateChatId(userId, contactId),
      message,
      date,
      userId,
      contactId,
    );
  }

  String _generateChatId(String userId, String contactId) {
    final ids = [userId, contactId];
    ids.sort();
    return '${ids[0]}_${ids[1]}';
  }

  void getMessages(String userId, String contactId) {
    _streamSubscription = _messagesRepository
        .getChats(
          _generateChatId(userId, contactId),
        )
        .listen(_onMessage);
  }

  void _onMessage(List<Message> messages) {
    emit(state.copyWith(messages: messages));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
