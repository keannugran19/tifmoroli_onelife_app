import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';
import 'package:tifmoroli_onelife_app/models/lessons.dart';
import 'package:tifmoroli_onelife_app/components/lesson_content.dart';

class NewBelieversLessons extends StatelessWidget {
  const NewBelieversLessons({
    super.key,
    required this.nblessonsList,
  });

  final List<Lessons> nblessonsList;

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
        itemCount: nblessonsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonContent(
                        lessonsList: nblessonsList,
                        selectedLessonIndex: index,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    'Lesson ${nblessonsList[index].lessonNumber}: ${nblessonsList[index].lessonTitle}',
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
