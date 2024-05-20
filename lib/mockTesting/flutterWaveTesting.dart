// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
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

  handlePaymentInitialization() async {}

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
