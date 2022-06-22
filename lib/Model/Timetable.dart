class Timetable {
  int? id;
  int? userId;
  String? subject;
  String? date;
  String? startTime;
  String? endTime;
  String? shift;
  String? room;
  int? teacherId;
  String? teacherName;

  Timetable(
      {this.id,
      this.userId,
      this.subject,
      this.date,
      this.startTime,
      this.endTime,
      this.shift,
      this.room,
      this.teacherId,
      this.teacherName});

  Timetable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    subject = json['subject'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    shift = json['shift'];
    room = json['room'];
    teacherId = json['teacherId'];
    teacherName = json['teacherName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['subject'] = this.subject;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['shift'] = this.shift;
    data['room'] = this.room;
    data['teacherId'] = this.teacherId;
    data['teacherName'] = this.teacherName;
    return data;
  }
}
