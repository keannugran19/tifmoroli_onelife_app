import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // About us dropdown
        ListTile(
      title: const Text(
        "About Us",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('About Us'),
          content: const Text(
              """TIFMOROLI One Life App: The ROL IT Department’s pioneering application aims to facilitate the distribution and accessibility of various lessons.
            
Leveraging the power of technology, the team has made it easier for users to retain knowledge by placing these lessons right at their fingertips.

© 2023 TIFMOROLI IT Department
          """),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Close'),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
