import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/custom_widgets/textField.dart';
import 'package:tai/screens/authentication/signUp/OTPinputPage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();

  //  global key for the form on this screen
  final _formKey = GlobalKey<FormState>();

  bool buttonIsDisabled = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF000000),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's get started!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Enter your phone number, We will send you a code.",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        onChanged: (p0) {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            setState(() {
                              buttonIsDisabled = false;
                            });
                          }else{
                            setState(() {
                              buttonIsDisabled = true;
                            });
                          }
                        },
                        controller: email,
                        label: "Email",
                        labelColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 80, 80, 80),
                        borderSideColor: Colors.transparent,
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 110,
                              height: 56,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                onChanged: (p0) {
                                  if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            setState(() {
                              buttonIsDisabled = false;
                            });
                          }else{
                            setState(() {
                              buttonIsDisabled = true;
                            });
                          }
                                },
                                controller: mobileNumber,
                                label: "Mobile Number",
                                labelColor: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 80, 80, 80),
                                borderSideColor: Colors.transparent,
                                keyBoardType: TextInputType.number,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Already have an account? Log in",
                  style: TextStyle(fontSize: 12, color: Color(0xFF466AE7)),
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "By clicking 'sign up' you agree to the",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        Text(
                          " privacy policy ",
                          style:
                              TextStyle(fontSize: 10, color: Color(0xFF466AE7)),
                        ),
                        Text(
                          "and",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        Text(
                          " terms and conditions",
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF4B5EFC),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    MainButton(
                      disabled: buttonIsDisabled,
                        lightBlue: true,
                        text: "Sign Up",
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
                                    builder: (context) => OTPinputScreen ()));
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
