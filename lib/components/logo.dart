import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 290,
      height: 290,
      fit: BoxFit.cover,
    );
  }
}
