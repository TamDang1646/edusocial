import 'package:edusocial/pages/classroom/classroom.dart';
import 'package:edusocial/pages/group/group_screen.dart';
import 'package:edusocial/pages/home_screen/home_screen.dart';
import 'package:edusocial/pages/message/message_screen.dart';
import 'package:flutter/material.dart';

class TabBarViewCus extends StatefulWidget {
  TabBarViewCus({
    super.key,
    required this.tabController,
  });
  TabController tabController;

  @override
  State<TabBarViewCus> createState() => _TabBarViewCusState();
}

class _TabBarViewCusState extends State<TabBarViewCus> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: const <Widget>[MyHomeScreen(), GroupScreen(), MessageScreen(), ClassroomScreen()],
    );
  }
}
