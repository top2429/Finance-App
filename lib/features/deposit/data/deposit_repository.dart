// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:tai/commonWidgets/customSnackBar.dart';
import 'package:tai/features/navBar/navBar.dart';
import 'package:tai/features/sendTo/data/sendMoneyToUser.dart';

String generateRandomString() {
  const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  String randomString = '';

  for (int i = 0; i < 10; i++) {
    randomString += characters[random.nextInt(characters.length)];
  }

  return randomString;
}

handlePaymentInitialization(String userId, String username, String? phoneNumber,
    String email, String amount, String txRef, BuildContext context) async {
  final Customer customer =
      Customer(name: username, phoneNumber: phoneNumber ?? "", email: email);
  final Flutterwave flutterwave = Flutterwave(
      context: context,
      publicKey: "FLWPUBK_TEST-9a87c713ef68a600a7869a05022ef2fa-X",
      currency: "UGX",
      redirectUrl: "add-your-redirect-url-here",
      txRef: txRef,
      amount: amount,
      customer: customer,
      paymentOptions: "ussd, card, barter, payattitude",
      customization: Customization(
          title: "Deposit to tai App",
          description:
              "your deposit amount will reflect on the home screen shortly"),
      isTestMode: true);

  ChargeResponse response = await flutterwave.charge();

  if (response.toJson()["status"] == "successful") {
    bool value = await updateTotalBalanceAmount(userId, amount);
    if (value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
    } else {
      CustomSnackBar.show(context, "Error with deposit", true);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
    }
  }
}

Future<bool> updateTotalBalanceAmount(String userId, String amount) async {
  var db = FirebaseFirestore.instance;

  try {
    double remainingBalance = await checkSenderBalance(userId);
    var query =
        await db.collection("users").where("userId", isEqualTo: userId).get();

    final dataQuery = query.docs;

    bool result = await dataQuery[0]
        .reference
        .update({"totalBalance": double.parse(amount) + remainingBalance}).then(
            (value) {
      return true;
    }, onError: (e) {
      return false;
    });

    if (result) {
      return true; // just a test
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
