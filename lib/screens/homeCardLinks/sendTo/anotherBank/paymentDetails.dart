import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/mainAppBar.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/custom_widgets/selectAccountWidget.dart';
import 'package:tai/custom_widgets/textField.dart';
import 'package:tai/custom_widgets/textField_arrowDown.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

enum Accounts { account_1, account_2 }

class _PaymentDetailsState extends State<PaymentDetails> {
  final _formKey = GlobalKey<FormState>();

  Accounts? character = Accounts.account_1;

  final sendFrom = TextEditingController();
  final sendTo = TextEditingController();
  final amount = TextEditingController();
  final reason = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Send to another bank",
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
                Text(
                  "Please enter the payment details",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFieldWidgetArrowDown(
                  controller: sendFrom,
                  label: "Send from",
                  onTap: () {
                    // Accounts? _character = Accounts.account_1;
        
                    showModalBottomSheet(
                        backgroundColor: Color.fromARGB(255, 240, 240, 240),
                        isScrollControlled: true,
                        enableDrag: true,
                        context: context,
                        builder: ((context) {
                          // Accounts? character = Accounts.account_1;
        
                          /* added a stateful builder because state in the bottom sheet is independent 
                          of the parent widget so the radio buttons need their own state scope to chage 
                          which the cant have in a model sheet without a stateful builder */
                          return StatefulBuilder(builder: (context, setState) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.7,
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    Row(children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(Icons.close)),
                                      Expanded(
                                          child: Center(
                                              child: Padding(
                                        padding: const EdgeInsets.only(right: 30),
                                        child: Text(
                                          "Send from",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      )))
                                    ]),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Please select an account",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Jerry Syre",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                    "Available balance : 4000RWF"),
                                                Text("400034543564553")
                                              ],
                                            ),
                                            Radio<Accounts>(
                                              focusColor: Color(0xFF466AE7),
                                              activeColor: Color(0xFF466AE7),
                                                value: Accounts.account_1,
                                                groupValue: character,
                                                onChanged: (Accounts? value) {
                                                  setState(() {
                                                    character = value;
                                                    sendFrom.text =
                                                        character.toString();
                                                    print(character);
                                                  });
                                                })
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Jerry Syre",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                    "Available balance : 4000RWF"),
                                                Text("400034543564553")
                                              ],
                                            ),
                                            Radio<Accounts>(
                                              focusColor: Color(0xFF466AE7),
                                              
                                              activeColor: Color(0xFF466AE7),
                                                value: Accounts.account_2,
                                                groupValue: character,
                                                onChanged: (Accounts? value) {
                                                  setState(() {
                                                    character = value;
                                                    sendFrom.text =
                                                        character.toString();
        
                                                    print(character);
                                                  });
                                                })
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            );
                          });
                        }));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidgetArrowDown(
                    controller: sendTo,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Column(
                                children: [
                                  Row(children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.close)),
                                    Expanded(
                                        child: Center(
                                            child: Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: Text(
                                        "Send to another bank a/c",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    )))
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Please select the recipient bank",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      child: Text(
                                          "create design for the bank details of the bank name and the account number to send to"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    label: "Send to"),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                  color: const Color.fromARGB(255, 240, 240, 240),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 110,
                              height: 56,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                backgroundColor:
                                    Color.fromARGB(255, 240, 240, 240),
                                textcolor: Colors.black,
                                onChanged: (p0) {},
                                controller: amount,
                                label: "Amount",
                                keyBoardType: TextInputType.number,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        onChanged: (p0) {},
                        controller: reason,
                        textcolor: Colors.black,
                        label: "Payment reason",
                        backgroundColor: Color.fromARGB(255, 240, 240, 240),
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 300,),
                      MainButton(text: "Send money", onpressed: (){})
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
