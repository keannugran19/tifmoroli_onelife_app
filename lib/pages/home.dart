import 'dart:ui';
import 'package:tifmoroli_onelife_app/components/title.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Image.asset(
              "lib/images/bg.jpg", // Replace with the path to your background image
              fit: BoxFit.cover,
            ),
          ),

          // Your Content
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height /
                  3, // Adjust the height as needed
              child: Image.asset(
                "lib/images/tifmoroli-logo.png", // Replace with the path to your photo
                height: double.infinity, // Maintain aspect ratio while resizing
                width: double.infinity,
                fit: BoxFit.contain, // You can change the BoxFit as needed
              ),
            ),
          ),

          titleSection,
        ],
      ),
    );
  }
}
