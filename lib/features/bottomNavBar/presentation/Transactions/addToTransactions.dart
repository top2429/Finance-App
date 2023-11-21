


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tai/features/bottomNavBar/presentation/Transactions/transactionsModel.dart';

addToTransactions(String senderId,String senderName, String receiverId,double amount) async {
      var db = FirebaseFirestore.instance;
      TransactionsModel transactionsModel = TransactionsModel(senderId,senderName ,receiverId, amount);
      await db.collection("transactions").add(transactionsModel.toJson());
}