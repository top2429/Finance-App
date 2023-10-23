import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/customTesting/test_splitFriends.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/screens/homeCardLinks/Request/splitBills/selectPeople.dart';

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
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset("assets/images/lightLine.svg"),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Select bill with.",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            CircularProfileImageList(numImages: 7),
            MainButton(
                text: "Continue",
                onpressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SelectPeople()));
                })
          ],
        ),
      )),
    );
  }
}
