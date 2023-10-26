import 'dart:math';

import 'package:flutter/material.dart';

class CircularProfileImageList extends StatelessWidget {
  final int numImages;

  const CircularProfileImageList({super.key, required this.numImages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Center(
        child: Stack(
          children: List.generate(numImages, (index) {
            final double angle = 2 * pi * index / numImages;
            const double radius = 80; // Adjust the radius as needed
    
            final double x = radius * cos(angle);
            final double y = radius * sin(angle);
    
            return Positioned(
              left: x + 120, // Adjust the position as needed
              top: y + 120, // Adjust the position as needed
              child: const CircleAvatar(
                radius: 30, // Adjust the size of each profile image
              ),
            );
          }),
        ),
      ),
    );
  }
}
