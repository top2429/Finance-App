import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/features/authentication/presentation/login/loginScreen.dart';
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's get started!",
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        authText: true,
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
                        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
                        borderSideColor: Colors.transparent,
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        authText: true,
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
                            const Color.fromARGB(255, 80, 80, 80),
                        borderSideColor: Colors.transparent,
                        keyBoardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 12, color:Colors.white),
                    ),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen ()));
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(fontSize: 12, color: Color(0xFF466AE7)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 360,),
                // const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
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
                      const SizedBox(
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
                                      builder: (context) => const LoginScreen ()));
                            }
                          })
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
