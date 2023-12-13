import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tai/commonWidgets/mainButton.dart';

class PaymentRequestedDetails extends StatefulWidget {
  final String  senderName;
  final double amount;
  final String reason;
  final String time;
  const PaymentRequestedDetails({super.key, required this.senderName, required this.amount, required this.reason, required this.time});

  @override
  State<PaymentRequestedDetails> createState() => _PaymentRequestedDetailsState();
}

class _PaymentRequestedDetailsState extends State<PaymentRequestedDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Payment Request Details",
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color.fromARGB(255, 240, 240, 240)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/blueTick.svg"),
                      const SizedBox(
                        height: 30,
                      ),
                       Center(
                          child: Text("Payment requested from ${widget.senderName}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                       Center(
                          child: Text(
                              "29th 11 2023    ${widget.time}",
                              style:
                                  const TextStyle(fontSize: 14, color: Colors.grey))),
                      const SizedBox(height: 40),
                      Center(
                          child: Text("UGX ${widget.amount}",
                              style: const TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold))),
                      Center(
                          child: Text(widget.reason,
                              style:
                                  const TextStyle(fontSize: 14, color: Colors.grey))),
                      const SizedBox(height: 40),
                      MainButton(text: "PAY", onpressed: (){
                        // Navigator.push(
                        //         context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               const MobileMoneyDetails()));
                      })
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
