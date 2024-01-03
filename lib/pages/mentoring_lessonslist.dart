import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';

class MentoringLessons extends StatelessWidget {
  const MentoringLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorScheme.secondary,
          title: const Text(
            'Mentoring Lessons',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
