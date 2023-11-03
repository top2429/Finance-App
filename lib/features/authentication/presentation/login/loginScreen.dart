import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';

import 'package:tai/features/authentication/presentation/signUp/enterPasscode_keyboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();

  //  global key for the form on this screen
  final _formKeyNumber = GlobalKey<FormState>();

  //  global key for the form on this screen
  final _formKeyEmail = GlobalKey<FormState>();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Log in to tai",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        // Customize the appearance and behavior of the tab bar
                        backgroundColor: Colors.white,
                        unselectedBackgroundColor:
                            const Color.fromARGB(255, 80, 80, 80),
                        borderWidth: 1,
                        borderColor: Colors.black,
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        // Add your tabs here
                        tabs: const [
                          Tab(
                              child: SizedBox(
                            width: 150,
                            child: Center(
                                child: Text(
                              "Phone Number",
                            )),
                          )),
                          Tab(
                              child: SizedBox(
                            width: 150,
                            child: Center(child: Text("Email")),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                                const Color.fromARGB(255, 80, 80, 80),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: 110,
                                        height: 56,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Form(
                                          key: _formKeyNumber,
                                          child: TextFieldWidget(
                                            onChanged: (p0) {
                                              
                                            },
                                            controller: mobileNumber,
                                            label: "Mobile Number",
                                            labelColor: Colors.white,
                                            backgroundColor:
                                                const Color.fromARGB(255, 80, 80, 80),
                                            borderSideColor: Colors.transparent,
                                            keyBoardType: TextInputType.number,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      " Lost access to my phone number",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF466AE7)),
                                    ),
                                  ),
                                  const Spacer(),
                                  MainButton(
                                      lightBlue: true,
                                      text: "Continue",
                                      onpressed: () {
                                        if (_formKeyNumber.currentState!
                                            .validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Processing Data')),
                                          );
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const EnterCode()));
                                        }
                                      })
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Form(
                                    key: _formKeyEmail,
                                    child: TextFieldWidget(
                                      onChanged: (p0) {
                                        
                                      },
                                      controller: email,
                                      label: "Email",
                                      labelColor: Colors.white,
                                      backgroundColor:
                                          const Color.fromARGB(255, 80, 80, 80),
                                      borderSideColor: Colors.transparent,
                                      keyBoardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      " Lost access to my email",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF466AE7)),
                                    ),
                                  ),
                                  const Spacer(),
                                  MainButton(
                                      lightBlue: true,
                                      text: "Continue",
                                      onpressed: () {
                                        if (_formKeyEmail.currentState!
                                            .validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Processing Data')),
                                          );
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const EnterCode()));
                                        }
                                      })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Spacer(),
              // Align(
              //   alignment: Alignment.center,
              //   child: MainButton(lightBlue: true,text: "Sign Up", onpressed: (){
              //     Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => OTPinputScreen()));

              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
