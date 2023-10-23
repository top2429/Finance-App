import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/arrowButton.dart';
import 'package:tai/screens/homeCardLinks/Request/customRequest/selectRecipient.dart';
import 'package:tai/screens/homeCardLinks/Request/splitBills/selectBillAmount.dart';

class ChooseMethod extends StatefulWidget {
  const ChooseMethod({super.key});

  @override
  State<ChooseMethod> createState() => _ChooseMethodState();
}

class _ChooseMethodState extends State<ChooseMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "New Request",
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
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Select how to receive payment",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  ArrowButton(
                      label: "Split bill",
                      image: "splitBill.svg",
                      innerContainerColor: const Color(0xFFFFE8A4),
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SelectBillAmount ()));
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  ArrowButton(
                      label: "Custom request",
                      image: "customRequest.svg",
                      innerContainerColor: const Color(0xFFC4F1CD),
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SelectRecipient ()));
                      })
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
