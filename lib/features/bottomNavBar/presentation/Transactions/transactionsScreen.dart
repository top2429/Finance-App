import 'package:flutter/material.dart';
import 'package:tai/features/bottomNavBar/presentation/Transactions/transactionsStreamBuilder.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override    
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: const FlexibleSpaceBar(
            // centerTitle: true,
            stretchModes: [
              StretchMode.fadeTitle,
              // StretchMode.blurBackground,
              StretchMode.zoomBackground
            ],
            collapseMode: CollapseMode.parallax,
            // background: Image.asset(
            //   "assets/images/wallpaper.jpeg",
            //   fit: BoxFit.cover,
            // ),
            title: Text(
              "Transactions history",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          // backgroundColor: const Color.fromARGB(255, 136, 201, 253),
          // expandedHeight: 200,
          pinned: true,
          stretch: true,
          onStretchTrigger: () async {
          },
          // floating: true,
          // snap: true,
          // centerTitle: true,
        ),       
        // const SliverToBoxAdapter(
        //   child: Padding(
        //     padding: EdgeInsets.only(left: 20, right: 20),
        //     child: TransactionsStreamBuilder(),
        //   ),
        // ),
        
      ]),
    );
  }
}
