import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tai/features/authentication/presentation/signUp/signUpScreen.dart';
import 'package:tai/features/bottomNavBar/presentation/navBar.dart';
import 'package:tai/mockTesting/lineChart.dart';
import 'package:tai/mockTesting/linearProgressIndicator.dart';
import 'package:tai/mockTesting/pieChart.dart';

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

      home: SignUpScreen(),
    );
  }
}

