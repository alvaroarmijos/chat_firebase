import 'package:chat_firebase/app/widgets/chat_avatar.dart';
import 'package:chat_firebase/packages/chat/domain/contact.dart';
import 'package:flutter/material.dart';

class ChatAppBarTitle extends StatelessWidget {
  const ChatAppBarTitle({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ChatAvatar(
              name: contact.name,
              urlImage: contact.photoUrl,
            ),
            SizedBox(
              width: 12,
              height: 12,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: contact.status ? Colors.green : Colors.red,
              )),
            )
          ],
        ),
        Expanded(
          child: ListTile(
            title: Text(
              contact.name,
              style: textTheme.labelLarge,
            ),
            subtitle: Text(
              contact.status ? 'Active now' : 'Offline',
              style: textTheme.bodySmall,
            ),
          ),
        )
      ],
    );
  }
}
