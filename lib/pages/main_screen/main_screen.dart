import 'package:edusocial/widgets/bottom_bar/bottom_bar.dart';
import 'package:edusocial/widgets/bottom_bar/tabbar_view.dart';
import 'package:edusocial/widgets/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomBarNavigator(
        tabController: _tabController,
      ),
      // bottomNavigationBar: BottomNavigationBar(),

      body: TabBarViewCus(tabController: _tabController),
      //   body: BottomBar.stackScreens[_selectedIndex],
      drawer: const NavBar(),
    );
  }
}


      //   bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Colors.amber,
      //     items: BottomBar.options,
      //     currentIndex: _selectedIndex,
      //     selectedItemColor: Colors.green[800],
      //     unselectedItemColor: Colors.grey,
      //     onTap: onTap,
      //     unselectedLabelStyle: const TextStyle(color: Colors.grey),
      //     showUnselectedLabels: true,
      //   ),
      //   bottomNavigationBar: Container(
      //     padding: const EdgeInsets.all(16),
      //     child: ClipRRect(
      //       borderRadius: const BorderRadius.all(Radius.circular(50)),
      //       child: Container(
      //         color: Colors.black38,
      //         child: TabBar(
      //           labelColor: Colors.black,
      //           unselectedLabelColor: Colors.white,
      //           labelStyle: const TextStyle(fontSize: 12),
      //           indicator: const UnderlineTabIndicator(
      //               borderSide: BorderSide(color: Colors.black54), insets: EdgeInsets.fromLTRB(50, 0, 50, 40)),
      //           indicatorColor: Colors.black54,
      //           tabs: const <Widget>[
      //             Tab(
      //               icon: Icon(
      //                 Icons.home,
      //               ),
      //               text: 'Home',
      //             ),
      //             Tab(
      //               icon: Icon(
      //                 Icons.group,
      //               ),
      //               text: 'Group',
      //             ),
      //             Tab(
      //               icon: Icon(
      //                 Icons.message,
      //               ),
      //               text: 'Message',
      //             ),
      //             Tab(
      //               icon: Icon(
      //                 Icons.class_outlined,
      //               ),
      //               text: 'Class',
      //             ),
      //           ],
      //           controller: _tabController,
      //         ),
      //       ),
      //     ),
      //   ),
      //   body: TabBarView(
      //     controller: _tabController,
      //     children: const <Widget>[MyHomeScreen(), GroupScreen(), MessageScreen(), ClassroomScreen()],
      //   ),