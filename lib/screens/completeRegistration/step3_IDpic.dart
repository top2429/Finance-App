import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/custom_widgets/textField.dart';
import 'package:tai/screens/completeRegistration/step4_takeSelfie.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Other Details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/darkLine.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset("assets/images/darkLine.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset("assets/images/darkLine.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset("assets/images/lightLine.svg"),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Column(
                      children: [
                        Text(
                          "Almost there!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                        SizedBox(height: 2,),
                        Text(
                          "A few more steps.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Scan your",
                          style: TextStyle(
                               fontSize: 36),
                        ),
                        SizedBox(height: 2,),
                        Text(
                          "identification card.",
                          style: TextStyle(
                               fontSize: 36),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MainButton(text: "Proceed", onpressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Step4()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
