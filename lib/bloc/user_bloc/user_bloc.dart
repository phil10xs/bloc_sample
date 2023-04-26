import 'package:bloc_example/bloc/user_bloc/user_bloc_event.dart';
import 'package:bloc_example/bloc/user_bloc/user_bloc_state.dart';
import 'package:bloc_example/bloc/user_bloc/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // ignore: prefer_final_fields
  UserService _userService = UserService();

  UserBloc() : super(InitialUserState()) {
    on<UserEvent>((event, showState) async {
      if (event is FetchCurrentUserInfoEvent) {
        showState(FetchingCurrentUserInfo());
        var user = await _userService.getCurrentUser();
        // ignore: unnecessary_null_comparison
        if (user != null) {
          showState(SaveCurrentUserInfo(user: user));
        }
      }
    });
  }
}
