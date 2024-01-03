import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';
import 'package:tifmoroli_onelife_app/models/lessons.dart';

class NBLesson extends StatelessWidget {
  const NBLesson(
      {super.key,
      required this.nblessonsList,
      required this.selectedLessonIndex});

  final List<Lessons> nblessonsList;
  final int selectedLessonIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorScheme.primary,
          title: Text(
            'Lesson ${nblessonsList[selectedLessonIndex].lessonNumber}: ${nblessonsList[selectedLessonIndex].lessonTitle}',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nblessonsList[selectedLessonIndex].lessonBody,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
