import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/screens/completeRegistration/step7_createPassCode_keyboard.dart';

class Step6 extends StatefulWidget {
  const Step6({super.key});

  @override
  State<Step6> createState() => _Step4State();
}

class _Step4State extends State<Step6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: const Icon(Icons.arrow_back),
        actions: const [
          // Padding(
          //   padding: const EdgeInsets.only(right: 15),
          //   child: Text(
          //     "Continue later",
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: Color(0xFF466AE7),
          //         fontSize: 16),
          //   ),
          // )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 240, 240),
                  borderRadius: BorderRadiusDirectional.circular(16)),
              height: 200,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Wait a minute.",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Analysing your profile verification",
              style: TextStyle(),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/check-mark.png",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Documents uploaded"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Image.asset(
                        "assets/images/check-mark.png",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Documents approved"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Image.asset(
                        "assets/images/check-mark.png",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Selfie approved"),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            MainButton(
                text: "Finish verification",
                onpressed: () {
                  Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const CreatePasscode()));
                })
          ],
        ),
      ),
    );
  }
}
