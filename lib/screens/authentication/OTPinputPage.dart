import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:tai/custom_widgets/mainButton.dart';

class OTPinputScreen extends StatefulWidget {
  const OTPinputScreen({super.key});

  @override
  State<OTPinputScreen> createState() => _OTPinputScreenState();
}

class _OTPinputScreenState extends State<OTPinputScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();

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
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter 6 digit code",
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
                //
                // OtpTextField(
                //   numberOfFields: 6,
                //   borderColor: Color(0xFF512DA8),
                //   //set to true to show as box or false to show as dash
                //   showFieldAsBox: true,
                //   //runs when a code is typed in
                //   onCodeChanged: (String code) {
                //     //handle validation or checks here
                //   },
                //   //runs when every textfield is filled
                //   onSubmit: (String verificationCode) {
                //     showDialog(
                //         context: context,
                //         builder: (context) {
                //           return AlertDialog(
                //             title: Text("Verification Code"),
                //             content: Text('Code entered is $verificationCode'),
                //           );
                //         });
                //   }, // end onSubmit
                // ),
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
                      height: 10,
                    ),
                    MainButton(
                        lightBlue: true, text: "Sign Up", onpressed: () {})
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
