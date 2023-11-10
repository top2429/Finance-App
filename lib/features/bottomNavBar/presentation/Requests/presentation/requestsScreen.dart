import 'package:flutter/material.dart';
import 'package:tai/features/bottomNavBar/presentation/Requests/presentation/paymentRequestDetailsCard.dart';
import 'package:tai/features/bottomNavBar/presentation/Requests/presentation/requestCard.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Payment requests",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RequestCard(
                        natureOfRequest: "Split the bill",
                        senderName: "Kudus Mohammed",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PaymentRequestedDetails()));
                        }),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Row(
            //   children: [
            //     Text(
            //       "Custom requests",
            //       style: TextStyle(color: Colors.grey),
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Expanded(
            //   child: ListView.builder(
            //     padding: EdgeInsets.zero,
            //     itemCount: 1,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.only(bottom: 10),
            //         child: RequestCard(
            //             natureOfRequest: "Pay for food",
            //             senderName: "Kudus Mohammed",
            //             onTap: () {}),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
