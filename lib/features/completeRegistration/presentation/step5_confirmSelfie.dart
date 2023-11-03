import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/features/completeRegistration/presentation/step6_finish.dart';


class Step5 extends StatefulWidget {
  const Step5({super.key});

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Retake",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              color: Colors.white,
            )),
            const SizedBox(
              height: 30,
            ),
            MainButton(
                lightBlue: true,
                text: "Continue with this picture",
                onpressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Step6()));
                })
          ]),
        ),
      ),
    );
  }
}
