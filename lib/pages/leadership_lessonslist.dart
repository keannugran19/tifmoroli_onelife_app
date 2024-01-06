import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';

import '../components/lesson_content.dart';
import '../models/lessons.dart';

class LeadershipLessons extends StatelessWidget {
  const LeadershipLessons({super.key, required this.ldlessonslist});

  final List<Lessons> ldlessonslist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorScheme.tertiary,
          title: const Text(
            'Leadership Lessons',
            style: TextStyle(color: Colors.white),
          )),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: ldlessonslist.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonContent(
                        lessonsList: ldlessonslist,
                        selectedLessonIndex: index,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    'Lesson ${ldlessonslist[index].lessonNumber}: ${ldlessonslist[index].lessonTitle}',
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
