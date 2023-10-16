import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/countrySelector.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/screens/onBoarding/onBoardingScreen1.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 2, child: Image.asset("assets/images/Frame.png")),
              SizedBox(
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
                SizedBox(
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
                SizedBox(
                  height: 50,
                ),
                CountryWidget(),
                SizedBox(
                  height: 100,
                ),
                MainButton(text: "Proceed", onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OnBoarding1()

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
