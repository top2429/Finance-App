import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/navbarIcons.dart';
import 'package:tai/screens/bottomNavBar/navBarScreens/Analytics.dart';
import 'package:tai/screens/bottomNavBar/navBarScreens/Budget.dart';
import 'package:tai/screens/bottomNavBar/navBarScreens/Chat.dart';
import 'package:tai/screens/bottomNavBar/navBarScreens/History.dart';
import 'package:tai/screens/bottomNavBar/navBarScreens/Home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int nowIndex = 0;
  void onTap(int index) {
    setState(() {
      nowIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List pages = [
      const HomeScreen(),
      const AnalyticsScreen(),
      const BudgetScreen(),
      const HistoryScreen(),
      const ChatScreen()
    ];
    return Scaffold(
      body: pages[nowIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(

            // unselectedLabelStyle: theme.textTheme.displaySmall,
            // selectedLabelStyle: theme.textTheme.displaySmall,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromARGB(255, 240, 240, 240),
            currentIndex: nowIndex,
            onTap: onTap,
            elevation: 0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: theme.primaryColor,
            // unselectedItemColor: theme.disabledColor,
            selectedIconTheme: IconThemeData(color: theme.primaryColor),
            unselectedIconTheme: IconThemeData(color: theme.disabledColor),
            items: [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: BarIcon(
                        name: 'Home', active: nowIndex == 0 ? true : false),
                  )),
              BottomNavigationBarItem(
                  label: "Analytics",
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: BarIcon(
                        name: 'Analytics', active: nowIndex == 1 ? true : false),
                  )),
              BottomNavigationBarItem(
                  label: "Budget",
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: BarIcon(
                        name: 'Budget', active: nowIndex == 2 ? true : false),
                  )),
              BottomNavigationBarItem(
                  label: "History",
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: BarIcon(
                        name: 'History', active: nowIndex == 3 ? true : false),
                  )),
              BottomNavigationBarItem(
                  label: "Chat",
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: BarIcon(
                        name: 'Chat', active: nowIndex == 4 ? true : false),
                  )),
            ]),
      ),
    );
  }
}
