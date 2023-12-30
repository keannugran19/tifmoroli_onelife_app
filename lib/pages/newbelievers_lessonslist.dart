import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';

class NewBelieversLessons extends StatelessWidget {
  const NewBelieversLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorScheme.primary,
          title: const Text(
            'New Believers Lessons',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
