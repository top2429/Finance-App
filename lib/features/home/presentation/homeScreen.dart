import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/commonWidgets/customSnackBar.dart';
import 'package:tai/commonWidgets/iconInCircle.dart';
import 'package:tai/features/Requests/presentation/chooseRequestMethod.dart';
import 'package:tai/features/Transactions/data/transactions_repository.dart';
import 'package:tai/features/Transactions/presentation/transactions_history_widget.dart';
import 'package:tai/features/authentication/presentation/current_user_controller.dart';

import 'package:tai/features/deposit/presentation/depositLocationsScreen.dart';
import 'package:tai/features/home/data/home_repository.dart';
import 'package:tai/features/profile/presentation/profileScreen.dart';
import 'package:tai/features/savingGoals/presentation/saving_goals_screen.dart';
import 'package:tai/features/sendTo/presentation/mobileMoneyWallet/mmdetails.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var value = ref.watch(currentUserControllerProvider);
    var asyncValue = ref.watch(transactionsListStreamProvider(value.userId!));
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
                                    builder: (context) => ProfileScreen(
                                          username: value.username!,
                                          email: value.email!,
                                          image: value.image!,
                                        )));
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: Image.asset(
                              "assets/images/${value.image}",
                              fit: BoxFit.cover,
                            ).image,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Hi ${value.username}")
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            CustomSnackBar.show(
                                context, "Not Implemented", true);
                          },
                          child: const Icon(
                            Icons.notifications_outlined,
                            size: 32,
                          ),
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
                              const Text(
                                "UGX",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Consumer(
                                builder: (context, ref, _) {
                                  final asyncNewUserModel = ref.watch(
                                      userModelStreamProvider(value.userId!));
                                  return asyncNewUserModel.when(
                                      data: (value) => Text(
                                            " ${value.totalBalance}",
                                            style: const TextStyle(
                                                fontSize: 36,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                      error: (e, st) => Text(e.toString()),
                                      loading: () => const SizedBox(
                                          width: 100,
                                          height: 20,
                                          child: LinearProgressIndicator()));
                                },
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
                                                  const ChooseRequestMethod()));
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
                                    image: "assets/images/cards.svg",
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SavingGoalsScreen()));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    "Goals",
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
                  height: 30,
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
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TransactionsHistoryWidget(
                  userId: value.userId!,
                  value: asyncValue,
                  forHomeScreen: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
