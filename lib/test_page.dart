import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/countrySelector.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/screens/onBoarding/onBoardingScreen1.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              MainButton(
                  text: "itWorks",
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OnBoarding1()));
                  }),
              SizedBox(
                height: 100,
              ),
              CountryWidget(),

              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Icon(Icons.home)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
