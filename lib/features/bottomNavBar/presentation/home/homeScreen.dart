import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tai/commonWidgets/iconInCircle.dart';
import 'package:tai/features/authentication/domain/userNotifier.dart';
import 'package:tai/features/bottomNavBar/presentation/Transactions/transactionsScreen.dart';
import 'package:tai/features/bottomNavBar/presentation/Transactions/transactionsStreamBuilder.dart';
import 'package:tai/features/deposit/presentation/depositLocationsScreen.dart';
import 'package:tai/features/profile/presentation/profileScreen.dart';
import 'package:tai/features/request/presentation/chooseCustomOrSplitRequestScreen.dart';
import 'package:tai/features/sendTo/presentation/mobileMoneyWallet/mmdetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var userNotifier = Provider.of<UserNotifier>(context, listen: true);
    print(
        "444444444444444444444444444444444444444444444444444444444444444444444444444444");
    print(userNotifier.user.image);
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
                                    builder: (context) =>
                                        const ProfileScreen()));
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: Image.asset(
                              "assets/images/${userNotifier.user.image}",
                              fit: BoxFit.cover,
                            ).image,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Hi ${userNotifier.user.username}")
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.notifications_outlined,
                          size: 32,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/images/uganda.svg",
                          width: 30,
                          height: 30,
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
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "UGX",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                " ${userNotifier.user.totalBalance}",
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
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
                                                  const MobileMoneyDetails()));
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
                            ],
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
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
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             fullscreenDialog: true,
                    //             builder: (context) =>
                    //                 const TransactionsScreen()));
                    //   },
                    //   child: const Row(children: [
                    //     Text(
                    //       "More",
                    //       style:
                    //           TextStyle(fontSize: 16, color: Color(0xFF466AE7)),
                    //     ),
                    //     Icon(
                    //       Icons.arrow_forward,
                    //       size: 22,
                    //       color: Color(0xFF466AE7),
                    //     )
                    //   ]),
                    // )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TransactionsStreamBuilder()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
