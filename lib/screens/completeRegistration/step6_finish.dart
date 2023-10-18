import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/screens/completeRegistration/step5_confirmSelfie.dart';
import 'package:tai/screens/keyboard/keyboard.dart';

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
        iconTheme: IconThemeData(color: Colors.black),
        leading: Icon(Icons.arrow_back),
        actions: [
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
                  color: Color.fromARGB(255, 240, 240, 240),
                  borderRadius: BorderRadiusDirectional.circular(16)),
              height: 200,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Wait a minute.",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Analysing your profile verification",
              style: TextStyle(),
            ),
            SizedBox(
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
                      SizedBox(
                        width: 10,
                      ),
                      Text("Documents uploaded"),
                    ],
                  ),
                  SizedBox(
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
                      SizedBox(
                        width: 10,
                      ),
                      Text("Documents approved"),
                    ],
                  ),
                  SizedBox(
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
                      SizedBox(
                        width: 10,
                      ),
                      Text("Selfie approved"),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            MainButton(
                text: "Finish verification",
                onpressed: () {
                  Navigator.push(context,
                            MaterialPageRoute(builder: (context) => KeyBoard()));
                })
          ],
        ),
      ),
    );
  }
}
