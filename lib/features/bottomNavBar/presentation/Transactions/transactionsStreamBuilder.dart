// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tai/features/authentication/domain/userNotifier.dart';

// class TransactionsStreamBuilder extends StatefulWidget {
//   const TransactionsStreamBuilder({super.key});

//   @override
//   State<TransactionsStreamBuilder> createState() =>
//       _TransactionsStreamBuilderState();
// }

// class _TransactionsStreamBuilderState extends State<TransactionsStreamBuilder> {
//   @override
//   Widget build(BuildContext context) {
//     var userNotifier = Provider.of<UserNotifier>(context, listen: true);

//     var query =
//         FirebaseFirestore.instance.collection("transactions").where(Filter.or(
//               Filter('senderId', isEqualTo: userNotifier.user.userId),
//               Filter('receiverId', isEqualTo: userNotifier.user.userId),
//             ));
//     Stream<QuerySnapshot<Map<String, dynamic>>> myStream = query.snapshots();

//     return StreamBuilder(
//         stream: myStream,
//         builder: (context, snapshots) {
//           return (snapshots.connectionState == ConnectionState.waiting)
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView.builder(
//                   shrinkWrap: true,
//                   primary: false,
//                   itemCount: snapshots.data!.docs.length,
//                   itemBuilder: (_, index) {
//                     var data = snapshots.data!.docs[index].data();
//                     if (data.isEmpty) {
//                       return const Center(
//                         child: Text("You have no transactions"),
//                       );
//                     }
//                     /* here you can create the transactions object with .fromMap
//                     and access the properties below from the object */
//                     String receiverId = data['receiverId'];
//                     String senderId = data['senderId'];
//                     String senderName = data['senderName'];
//                     String senderImage = data['senderImage'];
//                     String receiverName = data['receiverName'];
//                     String receiverImage = data['receiverImage'];
//                     if (userNotifier.user.userId == senderId) {

//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 240, 240, 240),
//                               borderRadius: BorderRadius.circular(24)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     CircleAvatar(
//                                       radius: 23,
//                                       backgroundImage: Image.asset(
//                                         "assets/images/$receiverImage",
//                                         fit: BoxFit.cover,
//                                       ).image,
//                                     ),
//                                     const SizedBox(
//                                       width: 14,
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(
//                                           height: 20,
//                                           width: 150,
//                                           child: Text("Sent to $receiverName",
//                                               overflow: TextOverflow.ellipsis,
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 15)),
//                                         ),
//                                         const SizedBox(
//                                           height: 4,
//                                         ),
//                                         Text("${data['time']}")
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 Text("UGX ${data['amount']}",
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.red,
//                                       // fontSize: 16),
//                                     ))
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }

//                     if (userNotifier.user.userId == receiverId) {
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 240, 240, 240),
//                               borderRadius: BorderRadius.circular(24)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     CircleAvatar(
//                                       radius: 23,
//                                       backgroundImage: Image.asset(
//                                         "assets/images/$senderImage",
//                                         fit: BoxFit.cover,
//                                       ).image,
//                                     ),
//                                     const SizedBox(
//                                       width: 14,
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(
//                                           height: 20,
//                                           width: 150,
//                                           child: Text("Sent from $senderName",
//                                               overflow: TextOverflow.ellipsis,
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 15)),
//                                         ),
//                                         const SizedBox(
//                                           height: 4,
//                                         ),
//                                         Text("${data['time']}")
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 Text(
//                                   "UGX ${data['amount']}",
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.green,
//                                       fontSize: 16),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }

//                     /// this return of container should not be return null
//                     /// returning null breaks the loop and the builder doesnt iterate through all
//                     /// the items in the list
//                     return Container();
//                   });
//         });
//   }
// }
