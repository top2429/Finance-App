import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArrowButton extends StatelessWidget {
  final String image;
  final String label;
  final Color innerContainerColor;
  final VoidCallback onTap;

  const ArrowButton(
      {super.key,
      required this.label,
      required this.image,
      required this.innerContainerColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color.fromARGB(255, 240, 240, 240)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: innerContainerColor, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset("assets/images/$image"),
                  )),
              const SizedBox(
                width: 20,
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }
}
