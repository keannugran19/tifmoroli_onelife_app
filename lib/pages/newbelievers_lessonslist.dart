import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';
import 'package:tifmoroli_onelife_app/models/lessons.dart';
import 'package:tifmoroli_onelife_app/pages/nb_lesson.dart';

class NewBelieversLessons extends StatelessWidget {
  const NewBelieversLessons({super.key, required this.lessonsList});

  final List<Lessons> lessonsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: const Text(
          'New Believers Lessons',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: lessonsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NBLesson(
                        nblessonsList: lessonsList,
                        selectedLessonIndex: index,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    'Lesson ${lessonsList[index].lessonNumber}: ${lessonsList[index].lessonTitle}',
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
