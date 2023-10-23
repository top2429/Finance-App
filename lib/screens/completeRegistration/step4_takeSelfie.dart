import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/screens/completeRegistration/step5_confirmSelfie.dart';

class Step4 extends StatefulWidget {
  const Step4({super.key});

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text(
              "Continue later",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF466AE7),
                  fontSize: 16),
            ),
          )
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
              "Take a selfie",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),

            const Text(
              "We use your selfie to compare with",
              style: TextStyle(),
            ),
            // SizedBox(height: 10,),

            const Text("your identification card"),
            const Spacer(),
            MainButton(text: "Continue", onpressed: (){
              Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Step5()));
            })
          ],
        ),
      ),
    );
  }
}
