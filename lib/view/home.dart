import 'package:bloc_example/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../bloc/user_bloc/user_bloc_event.dart';
import '../bloc/user_bloc/user_bloc_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _bloc = UserBloc();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then((value) {
      BlocProvider.of<UserBloc>(context).add(UserEvent());
      BlocProvider.of<UserBloc>(context).add(FetchCurrentUserInfoEvent());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is SaveCurrentUserInfo) {
          final user = state.user;
          return Scaffold(
            appBar: AppBar(
              title: Text('User Details'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${user!.firstName}'),
                  Text('Email: ${user.email}'),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
