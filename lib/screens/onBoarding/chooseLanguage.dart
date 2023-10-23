import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/countrySelector.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/screens/onBoarding/onBoardingScreen1.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 2, child: Image.asset("assets/images/Frame.png")),
              const SizedBox(
                height: 150,
              ),
              Expanded(flex: 1, child: Image.asset("assets/images/Frame.png")),
            ],
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        Text(
                          "Choose your",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "preferred language",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 50,
                ),
                const CountryWidget(),
                const SizedBox(
                  height: 100,
                ),
                MainButton(text: "Proceed", onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const OnBoarding1()

                                  ));
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
