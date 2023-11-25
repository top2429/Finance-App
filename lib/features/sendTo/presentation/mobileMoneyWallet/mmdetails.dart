import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/features/authentication/domain/userNotifier.dart';
import 'package:tai/features/sendTo/data/sendMoneyToUser.dart';

class MobileMoneyDetails extends StatefulWidget {
  const MobileMoneyDetails({super.key});

  @override
  State<MobileMoneyDetails> createState() => _MobileMoneyDetailsState();
}

class _MobileMoneyDetailsState extends State<MobileMoneyDetails> {
  String receiverId = "";
  String receiverName = "";
  String receiverImage = "";

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
                        const TextStyle(color: Colors.black, fontSize: 17),
                    viewHeaderTextStyle:
                        const TextStyle(color: Colors.black, fontSize: 17),
                    barHintStyle: MaterialStateProperty.resolveWith(
                      (states) => const TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    barTextStyle: MaterialStateProperty.resolveWith(
                      (states) => const TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    searchController: controller,
                    isFullScreen: false,
                    barSide: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(color: Colors.black)),
                    barElevation:
                        MaterialStateProperty.resolveWith((states) => 1),
                    barBackgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 255, 255, 255)),
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
                                    ? const Center(
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
                                                  receiverName =
                                                      data['username'];
                                                  receiverImage = data['image'];
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
                                                    receiverName =
                                                        data['username'];
                                                    receiverImage =
                                                        data['image'];
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
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("More details")),
                const SizedBox(
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
                                  userNotifier.user.image!,
                                  receiverId,
                                  receiverName,
                                  receiverImage,
                                  double.parse(amountController.text),
                                  context);
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
