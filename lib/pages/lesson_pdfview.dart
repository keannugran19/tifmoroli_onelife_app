import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfPdfViewer.asset('lib/assets/lessons/newbelievers/Lesson1.pdf'));
  }
}
