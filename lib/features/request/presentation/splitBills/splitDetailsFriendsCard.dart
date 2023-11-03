import 'package:flutter/material.dart';

class SplitDetailsCard extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SplitDetailsCard({super.key,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color.fromARGB(255, 240, 240, 240)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              const CircleAvatar(),
              
              const SizedBox(
                width: 20,
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text("10,000 RWF", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      );
  }
}