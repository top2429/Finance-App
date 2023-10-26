import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/arrowButton.dart';
import 'package:tai/screens/homeCardLinks/sendTo/anotherBank/paymentDetails.dart';
import 'package:tai/screens/homeCardLinks/sendTo/mobileMoneyWallet/mmdetails.dart';

class SendToOptions extends StatefulWidget {
  const SendToOptions({super.key});

  @override
  State<SendToOptions> createState() => _SendToOptionsState();
}

class _SendToOptionsState extends State<SendToOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Send To",
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
                "Select where to send",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                children: [
                  ArrowButton(
                      label: "Your own I&M bank",
                      image: "own.svg",
                      innerContainerColor: const Color(0xFFFCB3C5),
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
                      label: "Another I&M bank",
                      image: "another.svg",
                      innerContainerColor: const Color(0xFFDDD4FB),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MobileMoneyDetails()));
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  ArrowButton(
                      label: "Another Bank",
                      image: "bankTransfer.svg",
                      innerContainerColor: const Color(0xFFC4F1CD),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentDetails()));
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
