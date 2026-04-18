import 'package:tifmoroli_onelife_app/components/home_button.dart';
import 'package:tifmoroli_onelife_app/components/logo.dart';
import 'package:flutter/material.dart';
import 'package:tifmoroli_onelife_app/components/square_tile.dart';
import 'package:tifmoroli_onelife_app/components/about_dialog.dart';
import 'package:tifmoroli_onelife_app/constants/colors.dart';
import 'package:tifmoroli_onelife_app/data/lesson_data.dart';
import 'package:tifmoroli_onelife_app/pages/leadership_lessonslist.dart';
import 'package:tifmoroli_onelife_app/pages/mentoring_lessonslist.dart';
import 'package:tifmoroli_onelife_app/pages/newbelievers_lessonslist.dart';
import 'package:tifmoroli_onelife_app/pages/search_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "TIFMOROLI";
    const String appSubTitle = "One Life App";

    // redirect to facebook app/web
    Future<void> launchFacebook() async {
      String fbPageUrl;

      if (Platform.isIOS) {
        fbPageUrl = 'fb://profile/110388623457';
      } else {
        fbPageUrl = 'fb://page/110388623457';
      }
      const String fbWebUrl = 'https://www.facebook.com/tifmoroli';

      final Uri fbPageUri = Uri.parse(fbPageUrl);
      final Uri fbWebUri = Uri.parse(fbWebUrl);

      if (await canLaunchUrl(fbPageUri)) {
        await launchUrl(fbPageUri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(fbWebUri, mode: LaunchMode.externalApplication);
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      // drawer upon clicking the hamburger menu
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // app logo
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/tifmoroli-logo-new.png"),
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
                      fontWeight: FontWeight.w700,
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewBelieversLessons(
                                nblessonsList: nblessonsList)),
                      );
                    },
                  ),
                  ListTile(
                    enabled: false, //temporary
                    title: const Text(
                      "\t\tMentoring",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MentoringLessons(
                                  mtlessonslist: mtlessonsList,
                                )),
                      );
                    },
                  ),
                  ListTile(
                    enabled: false, //temporary
                    title: const Text(
                      "\t\tLeadership",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LeadershipLessons(
                                  ldlessonslist: ldlessonsList,
                                )),
                      );
                    },
                  ),
                  ListTile(
                    enabled: false, //temporary
                    title: const Text(
                      "\t\tOutreach",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                ],
              ),

              //* About Us ListTile with AlertDialog onclicked
              const DialogBox(),
            ],
          ),
        ),
      ),

      // Home Page UI
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Your Content
                    Logo(
                      image: 'assets/images/onelife-app.png',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),

                    // App Title
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "ONE LIFE APP",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.11,
                                letterSpacing: 0,
                                color: Color(0xFF203cf2)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            "Psalms 42: 1-2",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1,
                            ),
                            child: Text(
                              """'As a deer pants for flowing streams,
      so pants my soul for you, O God.
      My soul thirsts for God,
      for the living God.'""",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Builder(builder: (context) {
                  return HomeButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    buttonColor: colorScheme.secondary,
                    buttonText: "Menu",
                    buttonIcon: const Icon(Icons.menu, color: Colors.white),
                  );
                }),
                HomeButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(
                          nblessonsList: nblessonsList,
                          mtlessonsList: mtlessonsList,
                          ldlessonsList: ldlessonsList,
                        ),
                      ),
                    );
                  },
                  buttonColor: colorScheme.secondary,
                  buttonText: "Search",
                  buttonIcon: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Widgets moved to the bottom
            Column(
              children: [
                const Text(
                  'visit us on:',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareTile(
                      imagePath: 'assets/images/facebook.png',
                      onTap: () async {
                        await launchFacebook();
                      },
                    ),
                    SquareTile(
                      imagePath: 'assets/images/web.png',
                      onTap: () async {
                        const url = 'https://www.tifmoroli.org/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    )
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
