import 'package:chat_firebase/app/ui/colors.dart';
import 'package:chat_firebase/app/ui/navigator.dart';
import 'package:chat_firebase/app/widgets/chat_avatar.dart';
import 'package:chat_firebase/packages/chat/domain/contact.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        AppNavigator.navigateToChat(context, contact);
      },
      // leading: Container(
      //   clipBehavior: Clip.hardEdge,
      //   decoration: const BoxDecoration(shape: BoxShape.circle),
      //   child: Image.network(
      //     'https://photo-cdn2.icons8.com/OCUxgrB3qzbk934tC2nTmEl7VlvF-7f3LJ1fQ9HFuZA/rs:fit:576:384/czM6Ly9pY29uczgu/bW9vc2UtcHJvZC5l/eHRlcm5hbC9hMmE0/Mi82ODE1ODM3MTQ5/YTI0ZmE2YmEzYzBm/Njg0MDMyZjJlMy5q/cGc.webp',
      //   ),
      // ),
      // leading: ClipRRect(
      //   borderRadius: BorderRadius.circular(200),
      //   child: Image.network(
      //     'https://photo-cdn2.icons8.com/OCUxgrB3qzbk934tC2nTmEl7VlvF-7f3LJ1fQ9HFuZA/rs:fit:576:384/czM6Ly9pY29uczgu/bW9vc2UtcHJvZC5l/eHRlcm5hbC9hMmE0/Mi82ODE1ODM3MTQ5/YTI0ZmE2YmEzYzBm/Njg0MDMyZjJlMy5q/cGc.webp',
      //     width: 50,
      //     height: 50,
      //     fit: BoxFit.cover,
      //   ),
      // ),
      leading: ChatAvatar(
        name: contact.name,
        urlImage: contact.photoUrl,
      ),
      title: Text(
        contact.name,
      ),
      subtitle: Text(
        contact.status ? 'Online' : 'Offline',
        style: TextStyle(
          color: AppColors.darkGrey,
        ),
      ),
      trailing: SizedBox(
        width: 12,
        height: 12,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: contact.status ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
