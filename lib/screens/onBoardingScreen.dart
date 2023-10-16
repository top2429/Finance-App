import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
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
                          height: 440,
                          width: 170,
                          "assets/images/girl_1.png"),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image.asset(
                          "assets/images/sittingGuy_1.png",
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
                        SizedBox(height: 15,),
                        Column(
                          children: [
                            Text("data"),
                            Text("data"),
                            Text("data"),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/bigRect.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset("assets/images/smallRect.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset("assets/images/smallRect.png"),
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
                                onPressed: () {})
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ))
        ],
      ),
    );
  }
}
