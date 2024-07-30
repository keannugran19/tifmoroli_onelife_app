import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/pages/home.dart';
import 'package:tifmoroli_onelife_app/pages/lesson_pdfview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
