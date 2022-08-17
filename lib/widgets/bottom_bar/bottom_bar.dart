import 'package:flutter/material.dart';

class BottomBarNavigator extends StatefulWidget {
  BottomBarNavigator({super.key, required this.tabController});
  TabController tabController;
  @override
  State<BottomBarNavigator> createState() => _BottomBarNavigatorState();
}

class _BottomBarNavigatorState extends State<BottomBarNavigator> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          //   color: Colors.grey,
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xff333333).withOpacity(1),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pink[300]!, Colors.orange[300]!],
            ),
          ),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelStyle: const TextStyle(fontSize: 12),
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.green),
              //   insets: EdgeInsets.fromLTRB(50, 0, 50, 40),
            ),
            indicatorColor: Colors.black54,
            tabs: const <Widget>[
              Tab(
                icon: Icon(
                  Icons.home,
                ),
                iconMargin: EdgeInsets.only(bottom: 4),
                text: 'Home',
              ),
              Tab(
                icon: Icon(
                  Icons.group,
                ),
                iconMargin: EdgeInsets.only(bottom: 4),
                text: 'Group',
              ),
              Tab(
                iconMargin: EdgeInsets.only(bottom: 4),
                icon: Icon(
                  Icons.message,
                ),
                text: 'Message',
              ),
              Tab(
                iconMargin: EdgeInsets.only(bottom: 4),
                icon: Icon(
                  Icons.class_outlined,
                ),
                text: 'Class',
              ),
            ],
            controller: widget.tabController,
          ),
        ),
      ),
    );
  }
}
