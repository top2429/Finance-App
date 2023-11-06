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
      color: Colors.white,
borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
          const IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saving Goal",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Buy a Car",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        "Goal amount",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "2 million",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start date",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "21-12-23",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        "End date",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "11-03-24",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        "80%",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainButton(red: true,text: "Delete", onpressed:() {
                    
                  },),
                )),
                Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainButton(text: "Edit", onpressed:() {
                    
                  },),
                ))
            ],
          )
        ]),
      ),
    );
  }
}
