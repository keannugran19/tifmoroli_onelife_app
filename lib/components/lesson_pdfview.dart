import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:tifmoroli_onelife_app/models/lessons.dart';

class LessonView extends StatelessWidget {
  const LessonView(
      {super.key,
      required this.lessonsList,
      required this.selectedLessonIndex});

  final List<Lessons> lessonsList;
  final int selectedLessonIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SfPdfViewer.asset(
        lessonsList[selectedLessonIndex].lessonLink,
      ),
    );
  }
}
