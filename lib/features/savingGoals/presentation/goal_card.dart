// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoalCard extends StatefulWidget {
  final VoidCallback onTap;
  const GoalCard({super.key, required this.onTap});

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  double _progressValue = 0.25;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 240, 240),
            borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFC4F1CD), shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          "assets/images/savingGoal.svg",
                          height: 19,
                          width: 19,
                        ),
                      )),
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Buy a car",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text("UGX 500000"),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        width: 230,
                        child: LinearProgressIndicator(
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(5),
                          backgroundColor: Colors.grey,
                          color: const Color(0xFF466AE7),
                          value: _progressValue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Text(
                "25%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
