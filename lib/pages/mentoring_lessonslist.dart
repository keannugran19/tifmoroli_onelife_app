import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/components/lesson_pdfview.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';
import 'package:tifmoroli_onelife_app/models/lessons.dart';

import '../data/lesson_data.dart';

class MentoringLessons extends StatelessWidget {
  const MentoringLessons({super.key, required this.mtlessonslist});

  final List<Lessons> mtlessonslist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorScheme.secondary,
          title: const Text(
            'Mentoring Lessons',
            style: TextStyle(color: Colors.white),
          )),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: mtlessonslist.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonView(
                        lessonsList: mtlessonsList,
                        selectedLessonIndex: index,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    'Lesson ${mtlessonsList[index].lessonNumber}: ${mtlessonsList[index].lessonTitle}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
                height: 0,
                indent: 0,
                endIndent: 0,
              ),
            ],
          );
        },
      ),
    );
  }
}
