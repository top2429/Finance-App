import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/custom_widgets/textField.dart';
import 'package:tai/screens/completeRegistration/step2_residence.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

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
                      "Add Personal Details",
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
                        SvgPicture.asset("assets/images/lightLine.svg"),
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
                        controller: firstName,
                        controllerExist: "",
                        label: "First Name"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        keyBoardType: TextInputType.name,
                        textcolor: Colors.black,
                        controller: lastName,
                        controllerExist: "",
                        label: "Last name"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        keyBoardType: TextInputType.datetime,
                        textcolor: Colors.black,
                        controller:
                            dateOfBirth, // add a hint text for the date format
                        controllerExist: "",
                        label: "Date of Birth"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        keyBoardType: TextInputType.name,
                        textcolor: Colors.black,
                        controller: gender,
                        controllerExist: "",
                        label: "Gender"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        keyBoardType: TextInputType.emailAddress,
                        textcolor: Colors.black,
                        controller: email,
                        controllerExist: "",
                        label: "Email"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        keyBoardType: TextInputType.number,
                        textcolor: Colors.black,
                        controller: phone,
                        controllerExist: "",
                        label: "Phone Number"),
                        SizedBox(
                      height: 70,
                    ),
                    MainButton(text: "Next", onpressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Step2()));
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
