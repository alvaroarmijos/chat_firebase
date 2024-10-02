import 'package:chat_firebase/packages/messages/domain/message.dart';

abstract class MessagesRepository {
  Future<void> sendMessage(
    String chatId,
    String message,
    String date,
    String sentBy,
    String sentTo,
  );

  Stream<List<Message>> getChats(String chatId);
}
