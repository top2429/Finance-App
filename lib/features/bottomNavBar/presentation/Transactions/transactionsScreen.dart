import 'package:flutter/material.dart';

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
            print("done stretch");
          },
          // floating: true,
          // snap: true,
          // centerTitle: true,
        ),
        /* NOTE */
        /// THIS IS THE WIDGET THAT LETS YOU ADD SPACE BTN THE DIFFERENT KINDS OF SLIVERS 
        /// WITHIN THE SAME CUSTOMSCROLLVIEW
        SliverToBoxAdapter(),
        SliverList(
          delegate:
              SliverChildBuilderDelegate(childCount: 20, (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 5, left: 20, right: 20, top: 5),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sent to Muhammad",
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
          }),
        ),
      ]),
    );
  }
}
