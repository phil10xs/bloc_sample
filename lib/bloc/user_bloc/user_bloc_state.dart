import 'package:equatable/equatable.dart';

import '../../model/usermodel.dart';

class UserState extends Equatable {
  final User? user;
  UserState({this.user});
  @override
  List<Object> get props => [];
}

class SaveCurrentUserInfo extends UserState {
  final User user;
  SaveCurrentUserInfo({
    required this.user,
  }) : super(user: user);
}
