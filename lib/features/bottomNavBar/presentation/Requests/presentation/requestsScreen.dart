import 'package:flutter/material.dart';
import 'package:tai/features/bottomNavBar/presentation/Requests/presentation/paymentRequestDetailsCard.dart';
import 'package:tai/features/bottomNavBar/presentation/Requests/presentation/requestCard.dart';
import 'package:tai/features/bottomNavBar/presentation/Requests/presentation/requestsStreamBuilder.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Payment requests",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            RequestsStreamBuilder(),
            SizedBox(
              height: 30,
            ),
            
          ],
        ),
      ),
    );
  }
}
