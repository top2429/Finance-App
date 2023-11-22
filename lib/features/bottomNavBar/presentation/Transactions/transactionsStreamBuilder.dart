import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tai/features/authentication/domain/userNotifier.dart';

class TransactionsStreamBuilder extends StatefulWidget {
  const TransactionsStreamBuilder({super.key});

  @override
  State<TransactionsStreamBuilder> createState() =>
      _TransactionsStreamBuilderState();
}

class _TransactionsStreamBuilderState extends State<TransactionsStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    var userNotifier = Provider.of<UserNotifier>(context, listen: true);

    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('transactions').snapshots(),
        builder: (context, snapshots) {
          return (snapshots.connectionState == ConnectionState.waiting)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (_, index){
                    var data = snapshots.data!.docs[index].data();
                    if(data.isEmpty){
                      return Center(child: Text("You have no transactions"),);
                    }
                    String receiverId = data['receiverId'];
                    String senderId = data['senderId'];
                    String senderName = data['senderName'];
                    String senderImage = data['senderImage'];
                    String receiverName = data['receiverName'];
                    String receiverImage = data['receiverImage'];
                    if (senderId == userNotifier.user.userId) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 240, 240, 240),
                              borderRadius: BorderRadius.circular(24)),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 23,
                                      backgroundImage: Image.asset(
                                        "assets/images/$receiverImage",
                                        fit: BoxFit.cover,
                                      ).image,
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          width: 150,
                                          child: Text("Sent to $receiverName",
                                          overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text("${data['time']}")
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  "UGX ${data['amount']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    if (receiverId == userNotifier.user.userId){
                   return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(24)),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 23,
                                    backgroundImage: Image.asset(
                                      "assets/images/$senderImage",
                                      fit: BoxFit.cover,
                                    ).image,
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 150,
                                        child: Text("Sent from $senderName",
                                        overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text("${data['time']}")
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                "UGX ${data['amount']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                    return null;});
        });
  }
}
