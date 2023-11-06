import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/commonWidgets/iconInCircle.dart';
import 'package:tai/mockTesting/linearProgressIndicator.dart';

class GoalCard extends StatefulWidget {
  const GoalCard({super.key});

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  double _progressValue = 0.4;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFC4F1CD), shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        "assets/images/savingGoal.svg",
                        height: 19,
                        width: 19,
                      ),
                    )),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Buy a car",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(
                      height: 4,
                    ),
                    Text("2million RWF"),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: 230,
                      child: LinearProgressIndicator(
                        // semanticsLabel: 'File Download Progress',
                        // semanticsValue: '$_progressValue% complete',
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(5),
                        backgroundColor: Colors.grey,
                        color:  Color(0xFF466AE7),
                        value: _progressValue, // Set the value based on your data
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              "80%",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.green, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
