// ignore_for_file: file_names

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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          image,
          height: 39,
          width: 39,
        ),
      ),
    );
  }
}
