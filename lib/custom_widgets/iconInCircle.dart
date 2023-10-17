import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconCircle extends StatelessWidget {
  final String image;
  final VoidCallback onTap;
  const IconCircle({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}