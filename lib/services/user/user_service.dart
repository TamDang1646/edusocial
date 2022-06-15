import 'dart:developer';

import 'package:my_app/constains/mock/user.dart';
import 'package:my_app/log/logger.dart';

import '../../Model/User.dart';

class UserService {
  Future<User> getUser() async {
    User user = User.fromJson(mockUser);
    return user;
  }
}
