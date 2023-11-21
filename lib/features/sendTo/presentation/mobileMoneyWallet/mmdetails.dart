import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tai/commonWidgets/arrowButton.dart';
import 'package:tai/commonWidgets/keyboard.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/commonWidgets/textField_PlusSign.dart';
import 'package:tai/features/authentication/domain/userNotifier.dart';
import 'package:tai/features/sendTo/data/sendMoneyToUser.dart';

class MobileMoneyDetails extends StatefulWidget {
  const MobileMoneyDetails({super.key});

  @override
  State<MobileMoneyDetails> createState() => _MobileMoneyDetailsState();
}

enum Accounts { account_1, account_2 }

enum Operator { mtn, airtel }

class _MobileMoneyDetailsState extends State<MobileMoneyDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  FocusNode _focusNode = FocusNode();

  void _showKeyboard() {
    FocusScope.of(context).requestFocus(_focusNode);
  }

  String receiverId = "";

  final controller = SearchController();

  final _formKey = GlobalKey<FormState>();

  final sendTo = TextEditingController();
  final amountController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userNotifier = Provider.of<UserNotifier>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Send money to user",
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
                  "Please provide all the details",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 40,
                ),
                SearchAnchor.bar(
                    viewHeaderHintStyle:
                        TextStyle(color: Colors.black, fontSize: 17),
                    viewHeaderTextStyle:
                        TextStyle(color: Colors.black, fontSize: 17),
                    barHintStyle: MaterialStateProperty.resolveWith(
                      (states) => TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    barTextStyle: MaterialStateProperty.resolveWith(
                      (states) => TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    searchController: controller,
                    isFullScreen: false,
                    barSide: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(color: Colors.black)),
                    barElevation:
                        MaterialStateProperty.resolveWith((states) => 1),
                    barBackgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 255, 255, 255)),
                    barHintText: "Search user",
                    suggestionsBuilder: (context, controller) {
                      return [
                        SizedBox(
                          height: 500,
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .snapshots(),
                              builder: (context, snapshots) {
                                return (snapshots.connectionState ==
                                        ConnectionState.waiting)
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : ListView.builder(
                                        itemCount: snapshots.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          var data = snapshots.data!.docs[index]
                                              .data() as Map<String, dynamic>;
                                          if (controller.text.isEmpty) {
                                            return InkWell(
                                              onTap: () {
                                                controller.text =
                                                    data["username"];
                                                controller.closeView(
                                                    data["username"]);

                                                    setState(() {
                                                      receiverId = data["userId"];
                                                    });
                                              },
                                              child: InkWell(
                                                onTap: () {
                                                  controller.text =
                                                      data["username"];
                                                  controller.closeView(
                                                      data["username"]);

                                                       setState(() {
                                                      receiverId = data["userId"];
                                                    });
                                                },
                                                child: ListTile(
                                                  leading: CircleAvatar(
                                                    radius: 22,
                                                    backgroundImage:
                                                        Image.asset(
                                                      "assets/images/${data['image']}",
                                                      fit: BoxFit.cover,
                                                    ).image,
                                                  ),
                                                  title: Text(data["username"]),
                                                  subtitle: Text(data['email']),
                                                ),
                                              ),
                                            );
                                          }
                                          if (data['username']
                                              .toString()
                                              .startsWith(controller.text
                                                  .toLowerCase())) {
                                            return ListTile(
                                              leading: CircleAvatar(
                                                radius: 22,
                                                backgroundImage: Image.asset(
                                                  "assets/images/${data['image']}",
                                                  fit: BoxFit.cover,
                                                ).image,
                                              ),
                                              title: Text(data["username"]),
                                              subtitle: Text(data['email']),
                                            );
                                          }
                                          return Container();
                                        });
                              }),
                        )
                      ];
                    }),
                const SizedBox(
                  height: 40,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("More details")),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        backgroundColor:
                            const Color.fromARGB(255, 240, 240, 240),
                        textcolor: Colors.black,
                        onChanged: (p0) {},
                        controller: amountController,
                        label: "Amount",
                        keyBoardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        onChanged: (p0) {},
                        controller: reasonController,
                        textcolor: Colors.black,
                        label: "Payment reason",
                        backgroundColor:
                            const Color.fromARGB(255, 240, 240, 240),
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 300,
                      ),
                      MainButton(
                          text: "Send money",
                          onpressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              // sendMoneyToUser();
                              sendMoneyToUser(
                                  userNotifier.user.userId!,
                                  userNotifier.user.username!,
                                  receiverId,
                                  double.parse(amountController.text),context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Sending money')),
                              );
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
