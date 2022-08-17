import 'package:flutter/material.dart';

class TabBarCustom extends StatefulWidget {
  const TabBarCustom({
    Key? key,
    // required this.tabController,
    required this.tab,
    required this.tabView,
    this.width = 300,
    this.height = 45,
  }) : super(key: key);
//   final TabController tabController;
  final List<Widget> tab;
  final List<Widget> tabView;
  final double width;
  final double height;
  @override
  _TabBarCustomState createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Widget> _tab;
  late List<Widget> _tabView;
  late double _width;
  late double _height;
  @override
  void initState() {
    _tab = widget.tab;
    _tabView = widget.tabView;
    _height = widget.height;
    _width = widget.width;
    _tabController = TabController(length: _tab.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.green,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: _tab),
            ),
            // tab bar view here
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(controller: _tabController, children: _tabView),
            ),
          ],
        ),
      ),
    );
  }
}
