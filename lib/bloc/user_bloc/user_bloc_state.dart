import 'package:equatable/equatable.dart';

import '../../model/usermodel.dart';

class UserState extends Equatable {
  final User? user;
  final String? message;
  const UserState({
    this.user,
    this.message,
  });
  @override
  List<Object> get props => [];
}

class InitialUserState extends UserState {}

class FetchingCurrentUserInfoFailed extends UserState {
  @override
  final String? message;

  const FetchingCurrentUserInfoFailed({this.message}) : super(message: message);
}

class FetchingCurrentUserInfo extends UserState {}

class SaveCurrentUserInfo extends UserState {
  final User? user;
  const SaveCurrentUserInfo({
    required this.user,
  }) : super(user: user);
}
