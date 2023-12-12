import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/arrowButton.dart';
import 'package:tai/features/bottomNavBar/presentation/Requests/presentation/selectRecipient.dart';

class ChooseRequestMethod extends StatefulWidget {
  const ChooseRequestMethod({super.key});

  @override
  State<ChooseRequestMethod> createState() =>
      _ChooseRequestPaymentMethodState();
}

class _ChooseRequestPaymentMethodState extends State<ChooseRequestMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Request",
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
                "Select request method",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  ArrowButton(
                      label: "Custom",
                      image: "bankTransfer.svg",
                      innerContainerColor: const Color(0xFFC4F1CD),
                      onTap: () {
                        // Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => const SelectRecipient ()));
                      }),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
