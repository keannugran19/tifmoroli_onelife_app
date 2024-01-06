// lesson_component.dart
import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/models/lessons.dart';

class LessonContent extends StatelessWidget {
  const LessonContent(
      {super.key,
      required this.lessonsList,
      required this.selectedLessonIndex});

  final List<Lessons> lessonsList;
  final int selectedLessonIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Lesson ${lessonsList[selectedLessonIndex].lessonNumber}: ${lessonsList[selectedLessonIndex].lessonTitle}',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lessonsList[selectedLessonIndex].lessonBody,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
