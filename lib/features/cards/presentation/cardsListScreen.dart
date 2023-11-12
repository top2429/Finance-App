import 'package:flutter/material.dart';
import 'package:tai/features/cards/presentation/cardWidget.dart';

class CardsListScreen extends StatefulWidget {
  const CardsListScreen({super.key});

  @override
  State<CardsListScreen> createState() => _CardsListScreenState();
}

class _CardsListScreenState extends State<CardsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cards",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Card List",
                    style: TextStyle(fontSize: 19),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "Add new card",
                          style: TextStyle(color: Colors.blue),
                        ),
                        IconButton(
                            color: Colors.blue,
                            onPressed: () {},
                            icon: Icon(Icons.add))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 14,),
              CardWidget(),
        
              SizedBox(height: 40,),
              Row(
                children: [
                  Text("Card transactions", style: TextStyle(color: Colors.grey),)
                ],
              ),
              SizedBox(height: 20,),
               ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 5,
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
    );
  }
}
