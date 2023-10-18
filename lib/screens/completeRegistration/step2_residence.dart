import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/custom_widgets/textField.dart';
import 'package:tai/screens/completeRegistration/step3_IDpic.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final TextEditingController occupation = TextEditingController();
  final TextEditingController district = TextEditingController();
  final TextEditingController subCounty = TextEditingController();
  final TextEditingController village = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        SvgPicture.asset("assets/images/lightLine.svg"),
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset("assets/images/lightLine.svg"),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    TextFieldWidget(
                        keyBoardType: TextInputType.name,
                        textcolor: Colors.black,
                        controller: occupation,
                        controllerExist: "",
                        label: "Occupation"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        keyBoardType: TextInputType.name,
                        textcolor: Colors.black,
                        controller: district,
                        controllerExist: "",
                        label: "District"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        keyBoardType: TextInputType.name,
                        textcolor: Colors.black,
                        controller:
                            subCounty, // add a hint text for the date format
                        controllerExist: "",
                        label: "Subcounty"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        keyBoardType: TextInputType.name,
                        textcolor: Colors.black,
                        controller: village,
                        controllerExist: "",
                        label: "Village"),
                    SizedBox(
                      height: 20,
                    ),
                    
                        SizedBox(
                      height: 70,
                    ),
                    MainButton(text: "Next", onpressed: () {
                       Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Step3()));
                    })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
