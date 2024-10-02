import 'package:chat_firebase/packages/messages/domain/message.dart';
import 'package:chat_firebase/packages/messages/domain/messages_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class MessagesRepositoryImpl extends MessagesRepository {
  final _firebaseDatabase = FirebaseDatabase.instance;

  @override
  Future<void> sendMessage(
    String chatId,
    String message,
    String date,
    String sentBy,
    String sentTo,
  ) {
    return _firebaseDatabase.ref('chats').child(chatId).push().set({
      'message': message,
      'messageDate': date,
      'sentBy': sentBy,
      'sentTo': sentTo,
    });
  }

  @override
  Stream<List<Message>> getChats(String chatId) {
    return _firebaseDatabase
        .ref('chats')
        .child(chatId)
        .onValue
        .map((datavaseEvent) {
      if (datavaseEvent.snapshot.value != null) {
        return (datavaseEvent.snapshot.value as Map).values.toList();
      }

      return [];
    }).map(Message.fromJsonArray);
  }
}
