import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    CircleAvatar(radius: 24,),
                    SizedBox(height: 8,),
                    Text("Hi user")
                  ],),
                  Spacer(),
                  Row(children: [
                      Icon(Icons.notifications_outlined, size: 32,),
                      SizedBox(width: 10,),
                      CircleAvatar(radius: 16,)
                  ],)
                ],
              ),

              SizedBox(height: 30,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("data"),
                      SizedBox(height: 15,),
                      Text("data"),
                      SizedBox(height: 15,),
                      Text("data"),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Column(
                            children: [
                              IconCircle(image: "assets/images/home.svg", onTap: (){},)
                            ],
                          )
                        ],
                      )
                  ],),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}