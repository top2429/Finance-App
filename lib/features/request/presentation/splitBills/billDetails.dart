import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/commonWidgets/mainButton.dart';

import 'package:tai/features/request/presentation/splitBills/circleOfFriends.dart';
import 'package:tai/features/request/presentation/splitBills/splitDetailsFriendsCard.dart';
import 'package:tai/features/request/presentation/splitBills/splitRequestDetailsCard.dart';

class BillDetails extends StatefulWidget {
  const BillDetails({super.key});

  @override
  State<BillDetails> createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  final TextEditingController amount = TextEditingController();
  final TextEditingController purposeOfPayment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Split",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/darkLine.svg"),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset("assets/images/darkLine.svg"),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset("assets/images/darkLine.svg"),
                  
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CircularProfileImageList(numImages: 5, amount: "40,000 RWF",),
              const SizedBox(
                height: 10,
              ),
              SplitDetailsCard(label: "Jerry Syre", onTap: () {}),
              const SizedBox(
                height: 35,
              ),
              const Row(
                children: [
                  Text(
                    "Selected people",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    "devided equally (%)",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SplitDetailsCard(label: "Jerry Syre", onTap: () {}),
              const SizedBox(
                height: 20,
              ),
              SplitDetailsCard(label: "Jerry Syre", onTap: () {}),
              const SizedBox(
                height: 20,
              ),
              SplitDetailsCard(label: "Jerry Syre", onTap: () {}),
              const SizedBox(
                height: 60,
              ),
              MainButton(
                  text: "Continue",
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplitRequestedDetails()));
                  })
            ],
          ),
        ),
      )),
    );
  }
}
