import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/screens/classroom/exercise_view.dart';
import 'package:my_app/screens/classroom/room_meeting_view.dart';
import 'package:my_app/screens/classroom/timetable_view.dart';

import '../../widgets/tabbar/tabbar_cus.dart';

class ClassroomScreen extends StatefulWidget {
  const ClassroomScreen({super.key});

  @override
  State<ClassroomScreen> createState() => _ClassroomScreenState();
}

class _ClassroomScreenState extends State<ClassroomScreen> {
//   late final TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          //   Text("TimeTable"),
          const Expanded(
            child: TabBarCustom(
              tab: [
                Tab(
                  iconMargin: EdgeInsets.only(bottom: 4),
                  icon: Icon(FontAwesomeIcons.calendar),
                  text: 'Timetable',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  iconMargin: EdgeInsets.only(bottom: 4),
                  icon: Icon(Icons.class_outlined),
                  text: 'Exercise',
                ),
                // second tab [you can add an icon using the icon property]
                Tab(
                  icon: Icon(Icons.meeting_room),
                  iconMargin: EdgeInsets.only(bottom: 4),
                  text: 'Room meeting',
                ),
              ],
              tabView: [
                TimetableView(),
                ExerciseView(),
                RoomMeetingView(),
              ],
              width: 400,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }

  final tab = [
    // first tab [you can add an icon using the icon property]
  ];
}
