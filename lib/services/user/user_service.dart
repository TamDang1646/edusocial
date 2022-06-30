import 'dart:developer';

import 'package:edusocial/constains/mock/user.dart';
import 'package:edusocial/log/logger.dart';

import '../../Model/User.dart';

class UserService {
  Future<User> getUser() async {
    User user = User.fromJson(mockUser);
    return user;
  }
}
