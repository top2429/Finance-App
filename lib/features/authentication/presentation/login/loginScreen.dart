import 'package:firebase_auth/firebase_auth.dart';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/features/authentication/data/getUserInfo.dart';
import 'package:tai/features/authentication/domain/userNotifier.dart';

import 'package:tai/features/bottomNavBar/presentation/navBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //  global key for the form on this screen
  final _formKeyNumber = GlobalKey<FormState>();

  //  global key for the form on this screen
  final _formKeyEmail = GlobalKey<FormState>();

  void signin() async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) async {
        final user =  Provider.of<UserNotifier>(context, listen: false); 
      bool doneGettingUser = await getUser(user);
      if (doneGettingUser){
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
      }
    }).onError(
      (error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Container(
              padding: const EdgeInsets.all(16.0),
              height: 80.0,
              decoration: const BoxDecoration(
                  color: Color(0xFFC72C41),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Text("Wrong Credentials !"),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(154, 0, 0, 0),
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
                            child: Center(child: Text("Password")),
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
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Form(
                                    key: _formKeyNumber,
                                    child: TextFieldWidget(
                                      authText: true,
                                      onChanged: (p0) {},
                                      controller: emailController,
                                      label: "Email",
                                      labelColor: Colors.white,
                                      backgroundColor:
                                          const Color.fromARGB(255, 80, 80, 80),
                                      borderSideColor: Colors.transparent,
                                      keyBoardType:
                                          TextInputType.visiblePassword,
                                    ),
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
                                      authText: true,
                                      onChanged: (p0) {},
                                      controller: passwordController,
                                      label: "Password",
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
                                                                                  signin();

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Processing Data')),
                                          );
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
