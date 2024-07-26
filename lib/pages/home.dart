import 'package:flutter/cupertino.dart';
import 'package:tifmoroli_onelife_app/components/logo.dart';
import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/components/square_tile.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';
import 'package:tifmoroli_onelife_app/components/home_button.dart';
import 'package:tifmoroli_onelife_app/data/lesson_data.dart';
import 'package:tifmoroli_onelife_app/pages/leadership_lessonslist.dart';
import 'package:tifmoroli_onelife_app/pages/mentoring_lessonslist.dart';
import 'package:tifmoroli_onelife_app/pages/newbelievers_lessonslist.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "TIFMOROLI";
    const String appSubTitle = "One Life App";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/images/tifmoroli-logo-new.png"),
                      fit: BoxFit.contain)),
              child: const Text(""),
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
                    fontSize: 40,
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
                style: TextStyle(fontSize: 20),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // Lessons dropdown
            ExpansionTile(
              title: const Text(
                'Lessons',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              children: [
                ListTile(
                  title: const Text(
                    "\t\tNew Believers",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "\t\tMentoring",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "\t\tLeadership",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),

      // Home Page UI
      body: SafeArea(
        child: SingleChildScrollView(
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
                height: 20,
              ),

              HomeButton(
                buttonText: 'New Believers',
                buttonColor: colorScheme.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NewBelieversLessons(nblessonsList: nblessonsList)),
                  );
                },
              ),

              const SizedBox(
                height: 15,
              ),

              HomeButton(
                buttonText: 'Mentoring',
                buttonColor: colorScheme.secondary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MentoringLessons(
                              mtlessonslist: mtlessonsList,
                            )),
                  );
                },
              ),

              const SizedBox(
                height: 15,
              ),

              HomeButton(
                buttonText: 'Leadership',
                buttonColor: colorScheme.tertiary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LeadershipLessons(
                              ldlessonslist: ldlessonsList,
                            )),
                  );
                },
              ),

              const SizedBox(
                height: 30,
              ),

              const Text(
                'visit us on:',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SquareTile(
                    imagePath: 'lib/images/facebook.png',
                    onTap: () async {
                      const url = 'https://www.facebook.com/tifmoroli';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  SquareTile(
                    imagePath: 'lib/images/web.png',
                    onTap: () async {
                      const url = 'https://www.tifmoroli.com/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
