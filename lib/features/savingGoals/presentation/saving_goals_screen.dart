import 'package:flutter/material.dart';
import 'package:tai/features/savingGoals/presentation/create_new_goal_screen.dart';
import 'package:tai/features/savingGoals/presentation/dotted_widget.dart';
import 'package:tai/features/savingGoals/presentation/goal_card.dart';
import 'package:tai/features/savingGoals/presentation/goal_details_bottomSheet.dart';

class SavingGoalsScreen extends StatefulWidget {
  const SavingGoalsScreen({super.key});

  @override
  State<SavingGoalsScreen> createState() => _SavingGoalsScreenState();
}

class _SavingGoalsScreenState extends State<SavingGoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Saving goals",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateNewGoalScreen()));
                  },
                  child: CreateSavingGoalDotted()),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Text(
                    "My saving goals",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              GoalCard(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Color.fromARGB(255, 240, 240, 240),
                    isScrollControlled: true,
                    enableDrag: true,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.40,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(Icons.close)),
                                      const Expanded(
                                          child: Center(
                                              child: Padding(
                                        padding: EdgeInsets.only(right: 30),
                                        // TODO: add the name of the goal from the list
                                        child: Text(
                                          "Buy a car",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ))),
                                      Icon(Icons.delete, size: 28,color: Colors.red,)
                                    ]),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    GoalDetailsBottomSheetContainer()
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              // GoalCard(
              //   onTap: () {},
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // GoalCard(
              //   onTap: () {},
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // GoalCard(
              //   onTap: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
