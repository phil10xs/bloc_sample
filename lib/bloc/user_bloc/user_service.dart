import 'dart:convert';
import 'dart:math';

import 'package:bloc_example/model/usermodel.dart';
import 'package:flutter/services.dart';

class UserService {
  Future<User> getCurrentUser() async {
    var data = await rootBundle.loadString('android/assets/user.json');
    Map<String, dynamic> jsonResult = jsonDecode(data);
    var user = User.fromJson(jsonResult['user']);
    return user;
  }
}
