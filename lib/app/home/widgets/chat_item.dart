import 'package:chat_firebase/app/ui/colors.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {},
      // leading: ChateoAvatar(
      //   name: chatUser.name,
      //   photoUrl: chatUser.photoUrl,
      // ),
      title: const Text(
        'name',
      ),
      subtitle: Text(
        'Online',
        style: TextStyle(
          color: AppColors.darkGrey,
        ),
      ),
      trailing: const SizedBox(
        width: 12,
        height: 12,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
