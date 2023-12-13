import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tai/features/bottomNavBar/presentation/Transactions/addToTransactions.dart';

var db = FirebaseFirestore.instance;

Future<String> sendMoneyToUser(String senderId, String senderName, String senderImage,String receiverId, String receiverName,String receiverImage,
    double amount, BuildContext context) async {
  double senderBalance = await checkSenderBalance(senderId);

  if (senderBalance >= amount) {
    String deductStatus =
        await deductSenderBalance(senderId, amount, senderBalance, context);

    if (deductStatus == "success") {
      String response = await increaseReceiverBalance(amount, receiverId);
      if (response == "success") {
        TimeOfDay timeNow = TimeOfDay.now();
        addToTransactions(senderId, senderName,senderImage,receiverId, receiverName,receiverImage,amount, timeNow.format(context));
        return "Money sent successfully";
      } else {
        return "error sending";
      }
    } else {
      return "error sending";
    }
  } else {
    return "You have insufficient balance to make this transaction";
  }
}

Future<double> checkSenderBalance(String senderId) async {
  
  var query =
      await db.collection("users").where("userId", isEqualTo: senderId).get();

  final data = query.docs;

  Map<String, dynamic> dataObject = data[0].data();

  double userBalance = dataObject["totalBalance"];

  return userBalance;
}

Future<String> deductSenderBalance(
    String senderId, double amount, double senderBalance, context) async {
  var db = FirebaseFirestore.instance;

  var query =
      await db.collection("users").where("userId", isEqualTo: senderId).get();

  final dataQuery = query.docs;

  dataQuery[0].reference.update({"totalBalance": senderBalance - amount}).then(
      (value) {

    return "success";
  }, onError: (e) { return "false";});

  return "success";
}

 Future<String> increaseReceiverBalance(double amount, String receiverId) async {
  double receiverBalance = await checkReceiverBalance(receiverId);

  var db = FirebaseFirestore.instance;

  var query =
      await db.collection("users").where("userId", isEqualTo: receiverId).get();

  final dataQuery = query.docs;

  dataQuery[0]
      .reference
      .update({"totalBalance": amount + receiverBalance}).then((value) {

    return "success";
  }, onError: (e) => e.toString());

  return "success";
}

Future<double> checkReceiverBalance(String receiverId) async {
  var query =
      await db.collection("users").where("userId", isEqualTo: receiverId).get();

  final data = query.docs;

  Map<String, dynamic> dataObject = data[0].data();

  double userBalance = dataObject["totalBalance"];

  return userBalance;
}
