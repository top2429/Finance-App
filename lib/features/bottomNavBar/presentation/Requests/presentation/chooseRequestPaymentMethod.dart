import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/arrowButton.dart';

class ChooseRequestPaymentMethod extends StatefulWidget {
  const ChooseRequestPaymentMethod({super.key});

  @override
  State<ChooseRequestPaymentMethod> createState() => _ChooseRequestPaymentMethodState();
}

class _ChooseRequestPaymentMethodState extends State<ChooseRequestPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PAY",
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
                "Select payment method",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  ArrowButton(
                      label: "Card",
                      image: "card.svg",
                      innerContainerColor: const Color(0xFFFFE8A4),
                      onTap: () {
                        // Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => const SelectBillAmount ()));
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  ArrowButton(
                      label: "Mobile Money Wallet",
                      image: "mmWallet.svg",
                      innerContainerColor: const Color(0xFFC4F1CD),
                      onTap: () {
                        // Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => const SelectRecipient ()));
                      }),
                      const SizedBox(
                    height: 30,
                  ),
                      ArrowButton(
                      label: "Bank Transfer",
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