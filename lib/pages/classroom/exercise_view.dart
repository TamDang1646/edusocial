import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView({super.key});

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Bài tập',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              // borderRadius: BorderRadius.circular(0),
              boxShadow: const [
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
            child: Text(formattedDate),
          )
        ],
      ),
    );
  }
}
