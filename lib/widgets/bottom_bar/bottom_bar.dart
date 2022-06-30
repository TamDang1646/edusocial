import 'package:edusocial/screens/classroom/classroom.dart';
import 'package:edusocial/screens/group/group_screen.dart';
import 'package:edusocial/screens/home_screen/home_screen.dart';
import 'package:edusocial/screens/message/message_screen.dart';
import 'package:flutter/material.dart';

class BottomBar {
  static final stackScreens = [MyHomeScreen(), GroupScreen(), MessageScreen(), ClassroomScreen()];
  static const options = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.group,
        // color: Colors.black,
      ),
      label: 'Group',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: 'Message',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.class_outlined),
      label: 'Class',
    ),
  ];
}
