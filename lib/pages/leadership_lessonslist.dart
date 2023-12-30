import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';

class LeadershipLessons extends StatelessWidget {
  const LeadershipLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorScheme.tertiary,
          title: const Text(
            'Leadership Lessons',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
