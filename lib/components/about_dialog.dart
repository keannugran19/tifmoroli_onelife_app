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
              """The moment we knew God and believed in Him with all of our hearts, our souls long to know Him more, emanating a thirst from within. We hope his app helps us quench our thirst for the knowledge of God.
              
The One Life App is created for the members of The International Family Ministries of River of Life to have a learning resource in the palm of their hands. With this app, members can finally have One Life classes whenever and wherever.

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
