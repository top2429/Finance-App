import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/mainButton.dart';

class RequestCard extends StatefulWidget {
  final String senderName;
  final String natureOfRequest;
  final VoidCallback onTap;
  const RequestCard(
      {super.key, required this.natureOfRequest, required this.senderName, required this.onTap});

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.senderName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(widget.natureOfRequest, style: const TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),
            SizedBox(
              width: 110,
              child: MainButton(text: "Pay", onpressed: widget.onTap))
          ],
        ),
      ),
    );
  }
}
