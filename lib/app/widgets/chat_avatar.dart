import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({
    super.key,
    this.urlImage,
    required this.name,
  });

  final String? urlImage;
  final String name;

  @override
  Widget build(BuildContext context) {
    return urlImage != null
        ? CircleAvatar(
            backgroundImage: NetworkImage(urlImage!),
          )
        : name.isEmpty
            ? Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle,
                ),
              )
            : Avatar(
                name: name,
                shape: AvatarShape.circle(20),
              );
  }
}
