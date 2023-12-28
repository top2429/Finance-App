import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/mainButton.dart';

class GoalDetailsBottomSheetContainer extends StatefulWidget {
  const GoalDetailsBottomSheetContainer({super.key});

  @override
  State<GoalDetailsBottomSheetContainer> createState() =>
      _GoalDetailsBottomSheetContainerState();
}

class _GoalDetailsBottomSheetContainerState
    extends State<GoalDetailsBottomSheetContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Goal Amount",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "2 million",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    child: VerticalDivider(
                  thickness: 1,
                  color: Color.fromARGB(255, 212, 212, 212),
                  width: 12,
                )),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Duration",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "6 months",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    child: VerticalDivider(
                  thickness: 1,
                  color: Color.fromARGB(255, 212, 212, 212),
                  width: 12,
                )),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Saved",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "3500000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Remaining",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "1500000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    child: VerticalDivider(
                  thickness: 1,
                  color: Color.fromARGB(255, 212, 212, 212),
                  width: 12,
                )),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Target date",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "11-03-24",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    child: VerticalDivider(
                  thickness: 1,
                  color: Color.fromARGB(255, 212, 212, 212),
                  width: 12,
                )),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Progress",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "25%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainButton(
                  text: "Edit",
                  onpressed: () {},
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainButton(
                  text: "Pause",
                  onpressed: () {},
                ),
              ))
            ],
          )
        ]),
      ),
    );
  }
}
