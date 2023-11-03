import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/commonWidgets/iconInCircle.dart';
import 'package:tai/features/deposit/presentation/depositLocationsScreen.dart';
import 'package:tai/features/profile/presentation/profileScreen.dart';
import 'package:tai/features/request/presentation/chooseCustomOrSplitRequestScreen.dart';
import 'package:tai/features/sendTo/presentation/sendToOptionsScreen.dart';


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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfileScreen()));
                          },
                          child: const CircleAvatar(
                            radius: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text("Hi user")
                      ],
                    ),
                    const Spacer(),
                    const Row(
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
                const SizedBox(
                  height: 25,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF262329),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Available balance",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          const Row(
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
                          const SizedBox(
                            height: 1,
                          ),
                          const Text("ACC No. ****5678",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  IconCircle(
                                    image: "assets/images/sendTo.svg",
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SendToOptions()));
                                    },
                                  ),
                                  const SizedBox(
                                  
                                    height: 4,
                                  ),
                                  const Text(
                                    
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
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ChooseMethod()));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
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
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DepositLocations()));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
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
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
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
                const SizedBox(
                  height: 25,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Quick Links",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 136, 136, 136)),
                    )),
                const SizedBox(
                  height: 13,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFFDFF96)),
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
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  "add a/c",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                    "assets/images/savingGoals.svg"),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  "Saving Goals",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                    "assets/images/groupSaving.svg"),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  "Group Saving",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset("assets/images/cards.svg"),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  "Cards",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset("assets/images/more.svg"),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    "More",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Transaction History",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 136, 136, 136)),
                        )
                      ],
                    ),
                    Icon(
                      Icons.search,
                      size: 28,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 6,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 240, 240, 240),
                              borderRadius: BorderRadius.circular(24)),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Sent to MUhammad Putin",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text("14:30 PM")
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  "\$434.43",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
