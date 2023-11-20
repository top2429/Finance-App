import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/arrowButton.dart';
import 'package:tai/commonWidgets/keyboard.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/commonWidgets/textField_PlusSign.dart';

class MobileMoneyDetails extends StatefulWidget {
  const MobileMoneyDetails({super.key});

  @override
  State<MobileMoneyDetails> createState() => _MobileMoneyDetailsState();
}

enum Accounts { account_1, account_2 }

enum Operator { mtn, airtel }

class _MobileMoneyDetailsState extends State<MobileMoneyDetails> {
  Iterable<Widget> getSuggestions(SearchController controller) {
    final String input = controller.value.text;
    return [
      // ListTile(
      //       leading: CircleAvatar(backgroundColor: filteredColor.color),
      //       title: Text(filteredColor.label),
      //       trailing: IconButton(
      //         icon: const Icon(Icons.call_missed),
      //         onPressed: () {
      //           controller.text = filteredColor.label;
      //           controller.selection =
      //               TextSelection.collapsed(offset: controller.text.length);
      //         },
      //       ),
      //       onTap: () {
      //         controller.closeView(filteredColor.label);
      //         handleSelection(filteredColor);
      //       },
      //     ),];
    ];
  }

  // Iterable<Widget> getHistoryList(SearchController controller) {
  //   return searchHistory.map(
  //     (ColorLabel color) => ListTile(
  //       leading: const Icon(Icons.history),
  //       title: Text(color.label),
  //       trailing: IconButton(
  //         icon: const Icon(Icons.call_missed),
  //         onPressed: () {
  //           controller.text = color.label;
  //           controller.selection =
  //               TextSelection.collapsed(offset: controller.text.length);
  //         },
  //       ),
  //     ),
  //   );
  // }

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

  final controller = SearchController();

  final _formKey = GlobalKey<FormState>();

  Accounts? character = Accounts.account_1;
  Operator? service = Operator.mtn;

  final sendTo = TextEditingController();
  final amount = TextEditingController();
  final reason = TextEditingController();

  final phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  height: 30,
                ),
               
                SearchAnchor.bar(
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
                        Container(
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
                                            return ListTile(
                                              title: Text(data["username"]),
                                              subtitle: Text(data['email']),
                                            );
                                          }
                                          if (data['username']
                                              .toString()
                                              .startsWith(controller.text
                                                  .toLowerCase())) {
                                            return ListTile(
                                              title: Text(data["username"]),
                                              subtitle: Text(data['email']),
                                            );
                                          }
                                          return Center(
                                            child: Text("User doesnt exist"),
                                          );
                                        });
                              }),
                        )
                      ];
                    }),

                const SizedBox(
                  height: 60,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("More details")),
                  SizedBox(height: 15,),
                Form(
                  key: _formKey,
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
                      TextFieldWidget(
                        onChanged: (p0) {},
                        controller: reason,
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
