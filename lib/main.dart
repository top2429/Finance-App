import 'package:flutter/material.dart';
import 'package:tai/customTesting/test_page.dart';
import 'package:tai/screens/homeCardLinks/Request/splitBills/billDetails.dart';
import 'package:tai/screens/homeCardLinks/Request/splitBills/splitRequestedDetails.dart';
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

      home: SplitRequestedDetails(),
    );
  }
}

