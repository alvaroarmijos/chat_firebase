import 'package:chat_firebase/packages/chat/domain/contact.dart';

abstract class ChatRepository {
  Stream<List<Contact>> getContacts();
}
