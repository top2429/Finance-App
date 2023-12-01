import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/notImplemented.dart';
import 'package:tai/features/authentication/presentation/login/loginScreen.dart';


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
        backgroundColor: const Color(0xFF000000),
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
                const Text(
                  "Enter 6 digit code",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "Enter your phone number, We will send you a code.",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                //
                OtpTextField(
                  textStyle: const TextStyle(color: Colors.white),
                  mainAxisAlignment: MainAxisAlignment.start,
                  borderWidth: 0.1,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 80, 80, 80),
                  fieldWidth: 45,
                  margin: const EdgeInsets.only(left: 6, right: 6),
                  numberOfFields: 6,
                  borderColor: const Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here

                    // The verification code that will be returned here is the one to use for OTP verification. The value is [code]
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    // The verification code that will be returned here is the one to use for OTP verification. The value is [verification code]
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  }, // end onSubmit
                ),
                const SizedBox(height: 30,),
                const Row(
                      children: [
                        Text(
                          "Didn't receive SMS?",
                          style:
                              TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        Text(
                          " Resend SMS",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF466AE7)),
                        ),
                        
                      ],
                    ),
                const Spacer(),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: MainButton(
                      lightBlue: true, text: "Continue", onpressed: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NotImplemented()));
                  
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}