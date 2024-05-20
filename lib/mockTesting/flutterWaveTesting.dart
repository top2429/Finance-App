// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:http/http.dart';
import 'package:tai/commonWidgets/mainButton.dart';

class FlutterWaveTesting extends StatefulWidget {
  const FlutterWaveTesting({super.key});

  @override
  State<FlutterWaveTesting> createState() => _FlutterWaveTestingState();
}

class _FlutterWaveTestingState extends State<FlutterWaveTesting> {
  Future verifyTransaction(String transId, String publicKey) async {
    const url =
        "https://ravesandboxapi.flutterwave.com/v3/transactions/transId/verify";

    Client client = Client();
    final uri = Uri.parse(url);

    try {
      final response = await client.get(
        uri,
        headers: {
          HttpHeaders.authorizationHeader: publicKey,
          HttpHeaders.contentTypeHeader: 'application/json'
        },
      );

      json.decode(response.body);
    } catch (error) {
      rethrow;
    }
  }

  handlePaymentInitialization() async {
    final Customer customer = Customer(
        name: "Micheal Owen",
        phoneNumber: "256775854708",
        email: "jerrysyre@gmail.com");
    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: "FLWPUBK_TEST-9a87c713ef68a600a7869a05022ef2fa-X",
        currency: "UGX",
        redirectUrl: "add-your-redirect-url-here",
        txRef: "98736984373",
        amount: "30000",
        customer: customer,
        paymentOptions: "ussd, card, barter, payattitude",
        customization: Customization(title: "My Payment"),
        isTestMode: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MainButton(
            text: "flutterwave", onpressed: handlePaymentInitialization),
      ),
    );
  }
}
