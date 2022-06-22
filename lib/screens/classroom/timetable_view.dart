import 'package:flutter/material.dart';
import 'package:my_app/Model/Timetable.dart';
import 'package:my_app/routes/routes.dart';
import 'package:my_app/services/classroom/classroom_services.dart';

class TimetableView extends StatefulWidget {
  const TimetableView({super.key});

  @override
  State<TimetableView> createState() => _TimetableViewState();
}

class _TimetableViewState extends State<TimetableView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Timetable>>(
        future: ClassroomServices().getTimeTable(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              // inspect(snapshot.data[index]);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.joinMeetingingScreen);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 100,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.green,
                          width: 5,
                        ),
                      ),
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black38,
                          offset: Offset(4, 4),
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data![index].subject!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                snapshot.data![index].room!,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: Colors.grey[300]!,
                              ),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    //   decoration: BoxDecoration(border: Border.all()),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: snapshot.data![index].startTime,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: " - ${snapshot.data![index].endTime}",
                                              )
                                            ],
                                          ),
                                        ),
                                        Text(snapshot.data![index].teacherName!),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "ca: ${snapshot.data![index].shift!}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ]),
                        ),
                      )
                    ]),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
