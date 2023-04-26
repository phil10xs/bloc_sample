import 'dart:convert';

import 'package:bloc_example/model/usermodel.dart';
import 'package:flutter/services.dart';

class UserService {
  Future<User> getCurrentUser() async {
    String data = await rootBundle.loadString('assets/user.json');
    final jsonResult = jsonDecode(data);
    var user = User.fromJson(jsonResult);
    return user;
  }
}
