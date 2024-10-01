import 'package:chat_firebase/app/chat/widgets/message_item.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        MessageItem(
          mySelf: true,
          userName: 'userName',
          msg: 'msg asdfasdf asdfasdf',
          date: DateTime.now(),
        ),
        MessageItem(
          mySelf: false,
          userName: 'userName',
          msg: 'msg asdfas dfasdf asdf',
          date: DateTime.now(),
        ),
      ],
    );
  }
}
