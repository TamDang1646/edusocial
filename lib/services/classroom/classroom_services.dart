import 'package:edusocial/Model/Timetable.dart';
import 'package:edusocial/constains/mock/timetable.dart';

class ClassroomServices {
  Future<List<Timetable>> getTimeTable() async {
    List<Timetable> timetable = mockTimetable.map((e) => Timetable.fromJson(e)).toList();
    return timetable;
  }
}
