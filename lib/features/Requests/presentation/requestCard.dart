// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/mainButton.dart';

class RequestCard extends StatefulWidget {
  final String senderName;
  final String senderImage;
  final String natureOfRequest;
  final VoidCallback onTap;
  const RequestCard(
      {super.key,
      required this.natureOfRequest,
      required this.senderImage,
      required this.senderName,
      required this.onTap});

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
                CircleAvatar(
                  radius: 23,
                  backgroundImage: Image.asset(
                    "assets/images/${widget.senderImage}",
                    fit: BoxFit.cover,
                  ).image,
                ),
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
                    SizedBox(
                      height: 20,
                      width: 150,
                      child: Text(
                        widget.natureOfRequest,
                        style: const TextStyle(
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis),
                      ),
                    )
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
