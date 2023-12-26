import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/features/analytics/data/dummy_graph_values.dart';
import 'package:tai/features/analytics/presentation/income_graph.dart';
import 'package:tai/features/analytics/presentation/expenditure_graph.dart';
import 'package:tai/features/authentication/presentation/current_user_controller.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  List<FlSpot> expenditureSpots = [];
  List<FlSpot> incomeSpots = [];

  @override
  void initState() {
    super.initState();
    expenditureSpots = getExpenditures();
    incomeSpots = getIncome();
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = ref.watch(currentUserControllerProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 240, 240, 240),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Balance",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 92, 92, 92),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "UGX ${currentUser.totalBalance}",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ButtonsTabBar(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            tabs: [
                              Tab(
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    "assets/images/expenses.svg",
                                    color: Colors.red,
                                  ),
                                )),
                              ),
                              Tab(
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    "assets/images/income.svg",
                                    color: Colors.green,
                                  ),
                                )),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 255, 243, 243)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expenditure",
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 92, 92, 92),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "-UGX 4139889",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ),
                          ExpenditureGraph(
                            expenseSpots: expenditureSpots,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 243, 255, 243)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Income",
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 92, 92, 92),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "+UGX 4653519",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.green),
                                )
                              ],
                            ),
                          ),
                          IncomeGraph(
                            incomeSpots: incomeSpots,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
