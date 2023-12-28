import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }
}
