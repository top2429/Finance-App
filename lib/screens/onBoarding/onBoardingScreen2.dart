import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/screens/onBoarding/onBoardingScreen3.dart';

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({super.key});

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
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
          Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                          height: 440, width: 170, "assets/images/girl_2.png"),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image.asset(
                          "assets/images/sittingGuy_2.png",
                          height: 190,
                          width: 170,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Control your savings", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Create your savings account, Earn up to 5% interest", style: TextStyle(color: Colors.grey),),
                              Text(
                                  "Set saving goals.", style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/images/smallRect.svg"),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset("assets/images/bigRect.svg"),
                                SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset("assets/images/smallRect.svg"),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            FloatingActionButton(
                                shape: CircleBorder(),
                                // materialTapTargetSize:
                                //     MaterialTapTargetSize.shrinkWrap,
                                clipBehavior: Clip.none,
                                // mini: true,
                                child: const Icon(
                                  Icons.arrow_forward_outlined,
                                  size: 25,
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OnBoarding3()

                                  ));
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
