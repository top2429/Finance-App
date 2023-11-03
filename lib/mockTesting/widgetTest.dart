
import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/arrowButton.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/selectAccountWidget.dart';
import 'package:tai/commonWidgets/textField_arrowDown.dart';

import 'package:tai/features/onBoarding/languageSelector.dart';
import 'package:tai/features/onBoarding/onBoardingScreen1.dart';
import 'package:tai/features/request/presentation/splitBills/circleOfFriends.dart';


class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final sendFrom = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                MainButton(
                    text: "itWorks",
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoarding1()));
                    }),
                const SizedBox(
                  height: 100,
                ),
                const CountryWidget(),
                const SizedBox(
                  height: 50,
                ),
                ArrowButton(
                  label: "Split bill",
                  image: "splitBill.svg",
                  innerContainerColor: const Color(0xFFFFE8A4),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 50,
                ),
                const CircularProfileImageList(numImages: 4, amount: "84354",),
                const SizedBox(
                  height: 50,
                ),
                TextFieldWidgetArrowDown(
                  controller: sendFrom,
                  label: "Send from",
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                        isScrollControlled: true,
                        enableDrag: true,
                        context: context,
                        builder: ((context) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  Row(children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(Icons.close)),
                                    const Expanded(
                                        child: Center(
                                            child: Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child: Text(
                                        "Send from",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    )))
                                  ]),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Please select an account",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const SelectAccount()
                                ]),
                              ),
                            ),
                          );
                        }));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
