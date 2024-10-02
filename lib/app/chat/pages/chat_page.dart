import 'package:chat_firebase/app/chat/widgets/widgets.dart';
import 'package:chat_firebase/packages/chat/domain/contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        title: ChatAppBarTitle(
          contact: contact,
        ),
      ),
      body: Stack(
        children: [
          // List de mensajes
          Messages(
            contact: contact,
          ),
          // Widget
          ChatTextFormField(
            contactId: contact.id,
          ),
        ],
      ),
    );
  }
}
