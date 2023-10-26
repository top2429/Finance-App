import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArrowButton extends StatelessWidget {
  final String image;
  final String label;
  final Color innerContainerColor;
  final VoidCallback onTap;
  final bool plusIcon;

  const ArrowButton(
      {super.key,
      required this.label,
      required this.image,
      required this.innerContainerColor,
      required this.onTap,
      this.plusIcon = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: plusIcon?  const Color.fromARGB(255, 247, 245, 245):const Color.fromARGB(255, 240, 240, 240)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: innerContainerColor, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset("assets/images/$image",height: 19, width: 19,),
                  )),
              const SizedBox(
                width: 20,
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              plusIcon?const Icon(Icons.add): const Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }
}
