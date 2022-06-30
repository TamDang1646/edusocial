import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class RoomMeetingView extends StatefulWidget {
  const RoomMeetingView({super.key});

  @override
  State<RoomMeetingView> createState() => _RoomMeetingViewState();
}

class _RoomMeetingViewState extends State<RoomMeetingView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'RoomMeetingView',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
