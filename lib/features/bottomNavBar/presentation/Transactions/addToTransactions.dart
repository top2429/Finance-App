
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tai/features/bottomNavBar/presentation/Transactions/domain/transactionsModel.dart';

addToTransactions(String senderId,String senderName,String senderImage, String receiverId,String receiverName,String receiverImage, double amount,String time ) async {
      var db = FirebaseFirestore.instance;
      TransactionsModel transactionsModel = TransactionsModel(senderId,senderName ,senderImage,receiverId,receiverName, receiverImage ,amount, time);
      await db.collection("transactions").add(transactionsModel.toJson());
}