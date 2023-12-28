import 'dart:ui';
import 'package:tifmoroli_onelife_app/components/logo.dart';
import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/components/square_tile.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';
import 'package:tifmoroli_onelife_app/components/home_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "TIFMOROLI";
    const String appSubTitle = "One Life App";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: Column(
          children: [
            // Your Content
            const Logo(
              image: 'lib/images/tifmoroli-logo.png',
            ),
            // App Title
            Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.secondary,
                      colorScheme.tertiary
                    ], // Replace with your desired colors
                    stops: const [
                      0.0,
                      0.5,
                      1.0
                    ], // Adjust stops based on your preference
                  ).createShader(bounds);
                },
                child: const Text(
                  appTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    letterSpacing: 2.0,
                    color: Colors
                        .white, // Text color, choose a color that contrasts well with the gradient
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                appSubTitle,
                style: TextStyle(fontSize: 25),
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            HomeButton(
              buttonText: 'One Life Lessons',
              buttonColor: colorScheme.primary,
            ),

            const SizedBox(
              height: 20,
            ),

            HomeButton(
              buttonText: 'Mentoring Lessons',
              buttonColor: colorScheme.secondary,
            ),

            const SizedBox(
              height: 40,
            ),

            const Text(
              'visit us on:',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),

            const SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SquareTile(imagePath: 'lib/images/facebook.png', onTap: null),
                SquareTile(imagePath: 'lib/images/web.png', onTap: null)
              ],
            )
          ],
        ),
      ),
    );
  }
}
