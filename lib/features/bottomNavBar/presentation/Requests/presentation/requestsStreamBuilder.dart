import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tai/features/authentication/domain/userNotifier.dart';
import 'package:tai/features/bottomNavBar/presentation/Requests/presentation/paymentRequestDetailsCard.dart';
import 'package:tai/features/bottomNavBar/presentation/Requests/presentation/requestCard.dart';

class RequestsStreamBuilder extends StatefulWidget {
  const RequestsStreamBuilder({super.key});

  @override
  State<RequestsStreamBuilder> createState() => _RequestsStreamBuilderState();
}

class _RequestsStreamBuilderState extends State<RequestsStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    var userNotifier = Provider.of<UserNotifier>(context, listen: true);

    var query =
        FirebaseFirestore.instance.collection("requests").where(Filter.or(
              Filter('senderId', isEqualTo: userNotifier.user.userId),
              Filter('receiverId', isEqualTo: userNotifier.user.userId),
            ));
    Stream<QuerySnapshot<Map<String, dynamic>>> myStream = query.snapshots();

    return StreamBuilder(
        stream: myStream,
        builder: (context, snapshots) {
          return (snapshots.connectionState == ConnectionState.waiting)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (_, index) {
                    var data = snapshots.data!.docs[index].data();

                    /* here you can create the transactions object with .fromMap
                    and access the properties below from the object */
                    String receiverId = data['receiverId'];
                    String senderName = data['senderName'];
                    String reason = data['reason'];
                    String senderImage = data['senderImage'];

                    if (userNotifier.user.userId == receiverId) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: RequestCard(
                            natureOfRequest: reason,
                            senderImage: senderImage,
                            senderName: senderName,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentRequestedDetails(senderName: senderName,amount: data['amount'],reason: reason,time: data['time'],)));
                            }),
                      );
                    }

                    /// this return of container should not be return null
                    /// returning null breaks the loop and the builder doesnt iterate through all
                    /// the items in the list
                    return Container();
                  });
        });
  }
}
