import 'package:chat_firebase/app/home/bloc/home_bloc.dart';
import 'package:chat_firebase/app/home/widgets/chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetContactsEvent());
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Home',
                  style: textTheme.titleLarge,
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://photo-cdn2.icons8.com/OCUxgrB3qzbk934tC2nTmEl7VlvF-7f3LJ1fQ9HFuZA/rs:fit:576:384/czM6Ly9pY29uczgu/bW9vc2UtcHJvZC5l/eHRlcm5hbC9hMmE0/Mi82ODE1ODM3MTQ5/YTI0ZmE2YmEzYzBm/Njg0MDMyZjJlMy5q/cGc.webp'),
                ),
              ],
            ),
          ),
          const Chats(),
        ],
      ),
    );
  }
}
