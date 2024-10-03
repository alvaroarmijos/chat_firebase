import 'package:chat_firebase/app/auth/bloc/auth_bloc.dart';
import 'package:chat_firebase/app/home/bloc/home_bloc.dart';
import 'package:chat_firebase/app/home/widgets/chats.dart';
import 'package:chat_firebase/app/ui/navigator.dart';
import 'package:chat_firebase/app/widgets/chat_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    final homeBloc = context.read<HomeBloc>();

    _lifecycleListener = AppLifecycleListener(
      onResume: () => homeBloc.add(UpdateUserStatusEvent(status: true)),
      onPause: () => homeBloc.add(UpdateUserStatusEvent(status: false)),
      onDetach: () => homeBloc.add(UpdateUserStatusEvent(status: false)),
    );

    homeBloc
      ..add(GetContactsEvent())
      ..add(UpdateUserStatusEvent(status: true));

    super.initState();
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final userState = context.read<AuthBloc>().state;
    final user = userState is AuthStateLoggedIn ? userState.user : null;

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
                  style: textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AppNavigator.navigateToProfile(context);
                  },
                  child: ChatAvatar(
                    name: user?.displayName ?? '',
                    urlImage: user?.photoURL,
                  ),
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
