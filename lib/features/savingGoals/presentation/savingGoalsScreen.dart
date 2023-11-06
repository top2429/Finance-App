import 'package:flutter/material.dart';
import 'package:tai/features/savingGoals/presentation/createSavingGoal.dart';
import 'package:tai/features/savingGoals/presentation/goalCard.dart';

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
              CreateSavingGoalDotted(),
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
              GoalCard(),
              SizedBox(
                height: 15,
              ),
              GoalCard(),
              SizedBox(
                height: 15,
              ),
              GoalCard(),
              SizedBox(
                height: 15,
              ),
              GoalCard(),
            ],
          ),
        ),
      ),
    );
  }
}
