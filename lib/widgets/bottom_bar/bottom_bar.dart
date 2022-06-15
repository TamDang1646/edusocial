import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/constains/app_constaint.dart';
import 'package:my_app/screens/group/group_screen.dart';
import 'package:my_app/screens/home_screen/home_screen.dart';
import 'package:my_app/screens/menu/menu_screen.dart';
import 'package:my_app/screens/message/message_screen.dart';

import '../../routes/routes.dart';

class BottomBar {
  static const stackScreens = [MyHomeScreen(), GroupScreen(), MessageScreen(), MenuScreen()];
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
      icon: Icon(Icons.menu),
      label: 'Menu',
    ),
  ];
}
