import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/custom_widgets/iconInCircle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Hi user")
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 16,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF262329),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Available balance",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "RWF",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              " 2,430.00",
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text("ACC No. ****5678",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconCircle(
                                  image: "assets/images/sendTo.svg",
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Send to",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                IconCircle(
                                  image: "assets/images/request.svg",
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Request",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                IconCircle(
                                  image: "assets/images/deposit.svg",
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Deposit",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                IconCircle(
                                  image: "assets/images/loans.svg",
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Loans",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 25,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Quick Links",
                    style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 136, 136, 136)),
                  )),
              SizedBox(
                height: 13,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFFDFF96)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 14),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset("assets/images/add.svg"),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "existing a/c",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset("assets/images/savingGoals.svg"),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Saving Goals",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset("assets/images/groupSaving.svg"),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Group Saving",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset("assets/images/cards.svg"),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Cards",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset("assets/images/more.svg"),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "More",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
