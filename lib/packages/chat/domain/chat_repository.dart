import 'package:chat_firebase/packages/chat/domain/contact.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ChatRepository {
  Stream<List<Contact>> getContacts();

  Future<void> updateUserStatus(
    User user,
    bool status, {
    String? token,
  });
}
