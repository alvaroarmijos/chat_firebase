import 'package:chat_firebase/packages/chat/domain/chat_repository.dart';
import 'package:chat_firebase/packages/chat/domain/contact.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatRepositoryImpl extends ChatRepository {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  @override
  Stream<List<Contact>> getContacts() {
    return _firebaseDatabase.ref('contacts').onValue.map((databaseEvent) {
      if (databaseEvent.snapshot.value != null) {
        // Agregar el id al objeto para no repetir la data en la
        // base de datos
        return (databaseEvent.snapshot.value as Map).map((key, value) {
          final newMap = value as Map;
          newMap['id'] = key;
          return MapEntry(key, value);
        });
      }
      return {};
    }).map((data) => Contact.fromJsonArray(data.values.toList()));
  }
}
