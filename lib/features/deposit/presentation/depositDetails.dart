import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:provider/provider.dart';
import 'package:tai/commonWidgets/customSnackBar.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/commonWidgets/textField_PlusSign.dart';
import 'package:tai/features/authentication/domain/userNotifier.dart';
import 'package:tai/features/bottomNavBar/presentation/navBar.dart';
import 'package:tai/features/sendTo/data/sendMoneyToUser.dart';

class DepositDetails extends StatefulWidget {
  const DepositDetails({super.key});

  @override
  State<DepositDetails> createState() => _DepositDetailsState();
}

enum Operator { mtn, airtel }

class _DepositDetailsState extends State<DepositDetails> {
  /// Function to generate random string of characters to act as the transaction
  /// reference(txRef) for the flutterwave API
  String generateRandomString() {
    const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    String randomString = '';

    for (int i = 0; i < 10; i++) {
      randomString += characters[random.nextInt(characters.length)];
    }

    return randomString;
  }

  /// Function that directs you to the flutterwave payment portal
  /// and consequently update your wallet in the app
  handlePaymentInitialization(String userId, String username,
      String? phoneNumber, String email, String amount, String txRef) async {
    final Customer customer =
        Customer(name: username, phoneNumber: phoneNumber ?? "", email: email);
    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: "FLWPUBK_TEST-9a87c713ef68a600a7869a05022ef2fa-X",
        currency: "UGX",
        redirectUrl: "add-your-redirect-url-here",
        /* the page to display after the trensaction is successful */
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
    print("yeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    print(response);

    if (response.toJson()["status"] == "successful") {
      bool value = await updateTotalBalanceAmount(userId, amount);
      if (value) {
        CustomSnackBar.show(context, "Deposit successful", false);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const NavBar()));
      } else {
        CustomSnackBar.show(context, "Error with deposit", true);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const NavBar()));
      }
    }
  }

  /// Funtion to update the amount in the database to reflect your balance in the app
  Future<bool> updateTotalBalanceAmount(String userId, String amount) async {
    var db = FirebaseFirestore.instance;
    double remainingBalance = await checkSenderBalance(userId);
    var query =
        await db.collection("users").where("userId", isEqualTo: userId).get();

    final dataQuery = query.docs;

    dataQuery[0]
        .reference
        .update({"totalBalance": double.parse(amount) + remainingBalance}).then(
            (value) {
      var userNotifier = Provider.of<UserNotifier>(context, listen: false);
      userNotifier.updatePrice(double.parse(amount) + remainingBalance);
      return true;
      // CustomSnackBar.show(context, "Deposit successful", false);
    }, onError: (e) {
      return false;
      // CustomSnackBar.show(context, "Error with deposit", true);
    });
    return true;
  }

  /// global keys for the forms on this screen
  final _formKey = GlobalKey<FormState>();
  final _formKeyPhoneNumber = GlobalKey<FormState>();
  final _formKeyAmount = GlobalKey<FormState>();

  Operator? service = Operator.mtn;

  final sendTo = TextEditingController();
  final amount = TextEditingController();
  final reason = TextEditingController();
  final phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserNotifier userInfo = Provider.of<UserNotifier>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Deposit",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Please enter deposit details",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: TextFieldWidgetArrowDown(
                      controller: sendTo,
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor:
                              const Color.fromARGB(255, 240, 240, 240),
                          enableDrag: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    child: Column(
                                      children: [
                                        Row(children: [
                                          InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(Icons.close)),
                                          const Expanded(
                                              child: Center(
                                                  child: Padding(
                                            padding: EdgeInsets.only(right: 30),
                                            child: Text(
                                              "Operator",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          )))
                                        ]),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Please enter phone number",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Form(
                                          key: _formKeyPhoneNumber,
                                          child: TextFormField(
                                            onFieldSubmitted: (value) {
                                              // this will  handle the checks when the field is submitted
                                              // but before the button to proceed is pressed
                                            },

                                            // this is used for search functionality where it returns
                                            // some of the results depending on the values that are
                                            // already in the field
                                            onChanged: (value) {
                                              sendTo.text =
                                                  "${service!.name} - ${phoneNumber.text}";
                                              if (_formKeyPhoneNumber
                                                  .currentState!
                                                  .validate()) {
                                                // If the form is valid, display a snackbar. In the real world,
                                                // you'd often call a server or save the information in a database.
                                              } else {}
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'please provide a phone number';
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17),
                                            controller: phoneNumber,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 15,
                                                        bottom: 15,
                                                        left: 13),
                                                filled: true,
                                                fillColor: Colors.white,
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: const BorderSide(
                                                        color: Colors.black)),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.black)),
                                                label:
                                                    const Text("Phone number"),
                                                labelStyle: const TextStyle(
                                                    color: Colors.black)),
                                            keyboardType: TextInputType.name,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Select operator")),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              color: Colors.white),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/images/mtn.png"),
                                                    const SizedBox(
                                                      width: 13,
                                                    ),
                                                    const Text("Mobile Money")
                                                  ],
                                                ),
                                                Radio<Operator>(
                                                    focusColor:
                                                        const Color(0xFF466AE7),
                                                    activeColor:
                                                        const Color(0xFF466AE7),
                                                    value: Operator.mtn,
                                                    groupValue: service,
                                                    onChanged:
                                                        (Operator? value) {
                                                      setState(() {
                                                        service = value;
                                                        sendTo.text =
                                                            "${service!.name} - ${phoneNumber.text}";
                                                      });
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              color: Colors.white),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/images/airtel.png"),
                                                    const SizedBox(
                                                      width: 13,
                                                    ),
                                                    const Text("Airtel Money")
                                                  ],
                                                ),
                                                Radio<Operator>(
                                                    focusColor:
                                                        const Color(0xFF466AE7),
                                                    activeColor:
                                                        const Color(0xFF466AE7),
                                                    value: Operator.airtel,
                                                    groupValue: service,
                                                    onChanged:
                                                        (Operator? value) {
                                                      setState(() {
                                                        service = value;
                                                        sendTo.text =
                                                            "${service!.name} - ${phoneNumber.text}";
                                                      });
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      label: "Operator"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKeyAmount,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        backgroundColor:
                            const Color.fromARGB(255, 240, 240, 240),
                        textcolor: Colors.black,
                        onChanged: (p0) {},
                        controller: amount,
                        label: "Amount",
                        keyBoardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 350,
                      ),
                      MainButton(
                          text: "Continue",
                          onpressed: () {
                            if (_formKey.currentState!.validate() &&
                                _formKeyAmount.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.

                              String txRef = generateRandomString();
                              handlePaymentInitialization(
                                  userInfo.user.userId!,
                                  userInfo.user.username!,
                                  phoneNumber.text,
                                  userInfo.user.email!,
                                  amount.text,
                                  txRef);
                            }
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
