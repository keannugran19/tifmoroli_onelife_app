import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final logoSize = (screenWidth * 0.5); 

    return Image.asset(
      image,
      width: logoSize,
      height: logoSize,
      fit: BoxFit.cover,
    );
  }
}