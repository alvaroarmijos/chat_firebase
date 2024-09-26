import 'package:chat_firebase/packages/authentication/insfrastructure/authentication_repository_impl.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.8;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 12,
      ),
      height: height,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              bottom: 20,
            ),
            child: Text(
              'My Contacts',
              style: textTheme.labelLarge,
              textAlign: TextAlign.left,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final repository = AuthenticationRepositoryImpl();
                repository.logOut();
              },
              child: const Text('Log out'),
            ),
          ),
          // Flexible(
          //   child: ListView.builder(
          //     itemCount: 4,
          //     itemBuilder: (context, index) => const ChatItem(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
