import 'package:bloc_example/bloc/user_bloc/stream_bloc.dart';
import 'package:bloc_example/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../bloc/user_bloc/user_bloc_event.dart';
import '../bloc/user_bloc/user_bloc_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  static Route<dynamic> route({String? title}) {
    return MaterialPageRoute(
        builder: (_) => MyHomePage(
              title: title!,
            ),
        settings: RouteSettings(
            name: MyHomePage(
          title: title!,
        ).toStringShort()));
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      BlocProvider.of<UserBloc>(context).add(UserEvent());
      BlocProvider.of<UserBloc>(context).add(FetchCurrentUserInfoEvent());
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                  Text('Welcome to Apexive'),
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
