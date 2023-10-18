import 'package:flutter/material.dart';
import 'package:tai/screens/authentication/login/loginScreen.dart';
import 'package:tai/screens/authentication/signUp/OTPinputPage.dart';
import 'package:tai/screens/authentication/signUp/signUpScreen.dart';
import 'package:tai/screens/bottomNavBar/navBarScreens/navBarFile.dart';
import 'package:tai/screens/completeRegistration/step1_personal.dart';
import 'package:tai/screens/completeRegistration/step2_residence.dart';
import 'package:tai/screens/completeRegistration/step3_IDpic.dart';
import 'package:tai/screens/completeRegistration/step4_takeSelfie.dart';
import 'package:tai/screens/completeRegistration/step5_confirmSelfie.dart';
import 'package:tai/screens/completeRegistration/step6_finish.dart';
import 'package:tai/screens/keyboard/keyboard.dart';
import 'package:tai/screens/onBoarding/chooseLanguage.dart';
import 'package:tai/utils/custom_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData(context),
      themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,

      home: Step1(),
    );
  }
}

