import 'package:firebase_auth/firebase_auth.dart';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tai/commonWidgets/customSnackBar.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/features/authentication/data/getUserInfo.dart';
import 'package:tai/features/authentication/domain/userNotifier.dart';
import 'package:tai/features/authentication/presentation/login/OTPinputScreen.dart';
import 'package:tai/features/authentication/presentation/signUp/signUpScreen.dart';

import 'package:tai/features/bottomNavBar/presentation/navBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool buttonActive = true;

  //  global key for the form on this screen
  final _formKeyNumber = GlobalKey<FormState>();

  //  global key for the form on this screen
  final _formKeyEmail = GlobalKey<FormState>();

  void signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      final user = Provider.of<UserNotifier>(context, listen: false);
      bool doneGettingUser = await getUser(user);
      if (doneGettingUser) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const NavBar()));
      }
    } on FirebaseAuthException catch (e) {
      CustomSnackBar.show(context, e.code, true);
      setState(() {
        buttonActive = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(154, 0, 0, 0),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Log in to tai",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                "Login with Email or Phone number",
                style: TextStyle(fontSize: 12, color: Colors.white),
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
                            const Color.fromARGB(255, 114, 114, 114),
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
                              "Email",
                            )),
                          )),
                          Tab(
                              child: SizedBox(
                            width: 150,
                            child: Center(child: Text("Phone number")),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Expanded(
                        child: CustomScrollView(slivers: [
                          SliverFillRemaining(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Form(
                                        key: _formKeyEmail,
                                        child: Column(
                                          children: [
                                            TextFieldWidget(
                                              authText: true,
                                              onChanged: (p0) {},
                                              controller: emailController,
                                              label: "Email",
                                              labelColor: Colors.white,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 80, 80, 80),
                                              borderSideColor:
                                                  Colors.transparent,
                                              keyBoardType:
                                                  TextInputType.visiblePassword,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFieldWidget(
                                              obscureText: true,
                                              authText: true,
                                              onChanged: (p0) {},
                                              controller: passwordController,
                                              label: "Password",
                                              labelColor: Colors.white,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 80, 80, 80),
                                              borderSideColor:
                                                  Colors.transparent,
                                              keyBoardType:
                                                  TextInputType.visiblePassword,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen()));
                                        },
                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Dont have an account.",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 23, 109, 179)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Forgot password?",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 23, 109, 179)),
                                        ),
                                      ),
                                      const Spacer(),
                                      MainButton(
                                          indicator:
                                              buttonActive ? false : true,
                                          disabled: buttonActive ? false : true,
                                          lightBlue: true,
                                          text: "Submit",
                                          onpressed: () {
                                            if (_formKeyEmail.currentState!
                                                .validate()) {
                                              // If the form is valid, display a snackbar. In the real world,
                                              // you'd often call a server or save the information in a database.
                                              setState(() {
                                                buttonActive = false;
                                              });
                                              signin();
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
                                        key: _formKeyNumber,
                                        child: TextFieldWidget(
                                          authText: true,
                                          onChanged: (p0) {},
                                          controller: phoneNumberController,
                                          label: "Phone number",
                                          labelColor: Colors.white,
                                          backgroundColor: const Color.fromARGB(
                                              255, 80, 80, 80),
                                          borderSideColor: Colors.transparent,
                                          keyBoardType:
                                              TextInputType.emailAddress,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          " Lost access to my number",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 23, 109, 179)),
                                        ),
                                      ),
                                      const Spacer(),
                                      MainButton(
                                          lightBlue: true,
                                          text: "Submit",
                                          onpressed: () {
                                            if (_formKeyNumber.currentState!
                                                .validate()) {
                                              // If the form is valid, display a snackbar. In the real world,
                                              // you'd often call a server or save the information in a database.
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const OTPinputScreen()));
                                            }
                                          })
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
