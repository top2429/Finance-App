import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/arrowButton.dart';
import 'package:tai/commonWidgets/keyboard.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/commonWidgets/textField_PlusSign.dart';


class AnotherIandMbankDetails extends StatefulWidget {
  const AnotherIandMbankDetails({super.key});

  @override
  State<AnotherIandMbankDetails> createState() => _AnotherIandMbankDetailsState();
}

enum Accounts { account_1, account_2 }

class _AnotherIandMbankDetailsState extends State<AnotherIandMbankDetails> {
  final _formKey = GlobalKey<FormState>();

  Accounts? character = Accounts.account_1;

  final sendFrom = TextEditingController();
  final sendTo = TextEditingController();
  final amount = TextEditingController();
  final reason = TextEditingController();

  final user = TextEditingController();
    final accountNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Another I&M bank account",
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
                  "Please enter the payment details",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFieldWidgetArrowDown(
                  controller: sendFrom,
                  label: "Send from",
                  onTap: () {
                    // Accounts? _character = Accounts.account_1;

                    showModalBottomSheet(
                        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    Row(children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(Icons.close)),
                                      const Expanded(
                                          child: Center(
                                              child: Padding(
                                        padding:
                                            EdgeInsets.only(right: 30),
                                        child: Text(
                                          "Send from",
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
                                      "Please select an account",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 30,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Jerry Syre",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                    "Available balance : 4000RWF"),
                                                Text("400034543564553")
                                              ],
                                            ),
                                            Radio<Accounts>(
                                                focusColor: const Color(0xFF466AE7),
                                                activeColor: const Color(0xFF466AE7),
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Jerry Syre",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                    "Available balance : 4000RWF"),
                                                Text("400034543564553")
                                              ],
                                            ),
                                            Radio<Accounts>(
                                                focusColor: const Color(0xFF466AE7),
                                                activeColor: const Color(0xFF466AE7),
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
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidgetArrowDown(
                    controller: sendTo,
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                        enableDrag: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder:(context, setState) {
                              
                            
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
                                          child: const Icon(Icons.close)),
                                      const Expanded(
                                          child: Center(
                                              child: Padding(
                                        padding: EdgeInsets.only(right: 30),
                                        child: Text(
                                          "Send to user",
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
                                      "Please select the recipient",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      onFieldSubmitted: (value) {
                                        // this will  handle the checks when the field is submitted
                                        // but before the button to proceed is pressed
                                      },
                          
                                      // this is used for search functionality where it returns
                                      // some of the results depending on the values that are
                                      // already in the field
                                      // onChanged: widget.onChanged,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 17),
                                      controller: user,
                                      decoration: InputDecoration(
                                          suffixIcon: const Icon(
                                            Icons.search,
                                            color: Colors.black,
                                          ),
                                          contentPadding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 13),
                                          filled: true,
                                          fillColor: Colors.white,
                                          // errorText:
                                          //     widget.controllerExist.isEmpty ? null : widget.controllerExist,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.black)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.black)),
                                          label: const Text("Search user"),
                                          labelStyle:
                                              const TextStyle(color: Colors.black)
                                          //hintText: 'username',
                          
                                          ),
                                      keyboardType: TextInputType.name,
                          
                                      //  keyboardType: TextInputType.name,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ArrowButton(
                                        plusIcon: true,
                                        label: "Send to someone new",
                                        image: "addContact.svg",
                                        innerContainerColor: const Color(0xFFC4F1CD),
                                        onTap: () {}),
                          
                                        const SizedBox(height: 30,),
                          
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Enter account number")),
                                          const SizedBox(height: 10,),
                          
                                          
TextFormField(
                                      onFieldSubmitted: (value) {
                                        // this will  handle the checks when the field is submitted
                                        // but before the button to proceed is pressed
                                      },
                          
                                      // this is used for search functionality where it returns
                                      // some of the results depending on the values that are
                                      // already in the field
                                      // onChanged: widget.onChanged,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 17),
                                      controller: accountNumber,
                                      decoration: InputDecoration(
                                          
                                          contentPadding: const EdgeInsets.only(
                                              top: 15, bottom: 15, left: 13),
                                          filled: true,
                                          fillColor: Colors.white,
                                          // errorText:
                                          //     widget.controllerExist.isEmpty ? null : widget.controllerExist,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.black)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.black)),
                                          label: const Text("Account number"),
                                          labelStyle:
                                              const TextStyle(color: Colors.black)
                                          //hintText: 'username',
                          
                                          ),
                                      keyboardType: TextInputType.name,
                          
                                      //  keyboardType: TextInputType.name,
                                    ),




                                  ],
                                ),
                              ),
                            );},
                          );
                        },
                      );
                    },
                    label: "Send to"),
                const SizedBox(
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
                                  color:
                                      const Color.fromARGB(255, 240, 240, 240),
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
                                    const Color.fromARGB(255, 240, 240, 240),
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
                        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 300,
                      ),
                      MainButton(
                          text: "Send money",
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const KeyBoard()));
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
