import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/features/completeRegistration/presentation/step3_IDpic.dart';


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

  //  global key for the form on this screen
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
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
                    const Text(
                      "Other Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/darkLine.svg"),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset("assets/images/darkLine.svg"),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset("assets/images/lightLine.svg"),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset("assets/images/lightLine.svg"),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            onChanged: (p0) {
                              
                            },
                              keyBoardType: TextInputType.name,
                              textcolor: Colors.black,
                              controller: occupation,
                              label: "Occupation"),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: (p0) {
                              
                            },
                              keyBoardType: TextInputType.name,
                              textcolor: Colors.black,
                              controller: district,
                              label: "District"),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: (p0) {
                              
                            },
                              keyBoardType: TextInputType.name,
                              textcolor: Colors.black,
                              controller:
                                  subCounty, // add a hint text for the date format
                              label: "Subcounty"),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: (p0) {
                              
                            },
                              keyBoardType: TextInputType.name,
                              textcolor: Colors.black,
                              controller: village,
                              label: "Village"),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                    MainButton(
                        text: "Next",
                        onpressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Step3()));
                          }
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
