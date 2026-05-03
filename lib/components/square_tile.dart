import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const SquareTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // 1. Get the screen width
    final screenWidth = MediaQuery.sizeOf(context).width;
    final imageSize = (screenWidth * 0.1);
    final tilePadding = (screenWidth * 0.04);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(tilePadding),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[300],
        ),
        child: Image.asset(
          imagePath,
          height: imageSize,
          width:
              imageSize,
        ),
      ),
    );
  }
}
