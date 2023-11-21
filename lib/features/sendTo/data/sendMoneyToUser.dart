import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tai/features/authentication/domain/userNotifier.dart';

var db = FirebaseFirestore.instance;

Future<String> sendMoneyToUser(String senderId, String receiverId,
    double amount, BuildContext context) async {
  double senderBalance = await checkSenderBalance(senderId);

  if (senderBalance >= amount) {
    String deductStatus =
        await deductSenderBalance(senderId, amount, senderBalance, context);

    if (deductStatus == "success") {
      print("the deduction was successful and now its time to increase at the other side 2222222222222222222222222222222222222222222222222222222222222222222");
      String response = await increaseReceiverBalance(amount, receiverId);
      if (response == "success") {
        return "money sent successfully";
      } else {
        return "error sending 1";
      }
    } else {
      return "error sending 2";
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
    var userNotifier = Provider.of<UserNotifier>(context, listen: false);
    userNotifier.updatePrice(senderBalance - amount);
    print(
        "successfully updated the price in the database after sending to user");
    return "success";
  }, onError: (e) { return "false";});

  return "success";
}

 Future<String> increaseReceiverBalance(double amount, String receiverId) async {
  print("this is where the code stops executing");
  double receiverBalance = await checkReceiverBalance(receiverId);

  var db = FirebaseFirestore.instance;

  var query =
      await db.collection("users").where("userId", isEqualTo: receiverId).get();

  final dataQuery = query.docs;

  dataQuery[0]
      .reference
      .update({"totalBalance": amount + receiverBalance}).then((value) {
    print(
        "successfully updated the price in the database after receiving from sender");
    return "success";
  }, onError: (e) => e.toString());

  return "failed";
}

Future<double> checkReceiverBalance(String receiverId) async {
  var query =
      await db.collection("users").where("userId", isEqualTo: receiverId).get();

  final data = query.docs;

  Map<String, dynamic> dataObject = data[0].data();

  double userBalance = dataObject["totalBalance"];

  return userBalance;
}
