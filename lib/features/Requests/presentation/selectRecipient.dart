// ignore_for_file: file_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/commonWidgets/customSnackBar.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/features/Requests/data/requests_repository.dart';
import 'package:tai/features/authentication/presentation/current_user_controller.dart';
import 'package:tai/features/navBar/navBar.dart';

class SelectRecipient extends ConsumerStatefulWidget {
  const SelectRecipient({super.key});

  @override
  ConsumerState<SelectRecipient> createState() => _SelectRecipientState();
}

class _SelectRecipientState extends ConsumerState<SelectRecipient> {
  String receiverId = "";
  String receiverName = "";
  String receiverImage = "";

  bool buttonActive = true;

  final controller = SearchController();

  final _formKey = GlobalKey<FormState>();

  final sendTo = TextEditingController();
  final amountController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.read(currentUserControllerProvider);
    final requestProvider = RequestsRepository();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: MainButton(
            indicator: buttonActive ? false : true,
            disabled: buttonActive ? false : true,
            text: "Request money",
            onpressed: () async {
              TimeOfDay timeNow = TimeOfDay.now();

              if (_formKey.currentState!.validate()) {
                if (receiverId.isEmpty) {
                  CustomSnackBar.show(context, "Select recipient", true);
                } else {
                  setState(() {
                    buttonActive = false;
                  });
                  bool response = await requestProvider.sendRequest(
                      currentUser.userId!,
                      currentUser.username!,
                      currentUser.image!,
                      receiverId,
                      receiverName,
                      receiverImage,
                      double.parse(amountController.text),
                      timeNow.format(context),
                      reasonController.text);

                  if (response) {
                    CustomSnackBar.show(context, "Request sent", false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBar()));
                  } else {
                    CustomSnackBar.show(context, "Error sending request", true);
                    setState(() {
                      buttonActive = true;
                    });
                  }
                }
              }
            }),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Request money from user",
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black26),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 10, top: 10),
                    child: Column(
                      children: [
                        const Text(
                          "Search and select for user to request from",
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SearchAnchor.bar(
                            viewHeaderHintStyle: const TextStyle(
                                color: Colors.black, fontSize: 17),
                            viewHeaderTextStyle: const TextStyle(
                                color: Colors.black, fontSize: 17),
                            barHintStyle: MaterialStateProperty.resolveWith(
                              (states) => const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                            barTextStyle: MaterialStateProperty.resolveWith(
                              (states) => const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                            searchController: controller,
                            isFullScreen: false,
                            barSide: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    const BorderSide(color: Colors.black)),
                            barElevation: MaterialStateProperty.resolveWith(
                                (states) => 1),
                            barBackgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromARGB(255, 255, 255, 255)),
                            barHintText: "Search for recipient",
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
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : ListView.builder(
                                                itemCount:
                                                    snapshots.data!.docs.length,
                                                itemBuilder: (context, index) {
                                                  var data = snapshots
                                                          .data!.docs[index]
                                                          .data()
                                                      as Map<String, dynamic>;
                                                  if (controller.text.isEmpty) {
                                                    return InkWell(
                                                      onTap: () {
                                                        controller.text =
                                                            data["username"];
                                                        controller.closeView(
                                                            data["username"]);

                                                        setState(() {
                                                          receiverId =
                                                              data["userId"];
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
                                                        title: Text(
                                                            data["username"]),
                                                        subtitle:
                                                            Text(data['email']),
                                                      ),
                                                    );
                                                  }
                                                  if (data['username']
                                                      .toString()
                                                      .contains(
                                                          controller.text)) {
                                                    return InkWell(
                                                      onTap: () {
                                                        controller.text =
                                                            data["username"];
                                                        controller.closeView(
                                                            data["username"]);

                                                        setState(() {
                                                          receiverId =
                                                              data["userId"];
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
                                                        title: Text(
                                                            data["username"]),
                                                        subtitle:
                                                            Text(data['email']),
                                                      ),
                                                    );
                                                  }
                                                  return Container();
                                                });
                                      }),
                                )
                              ];
                            }),
                      ],
                    ),
                  ),
                ),
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
                        label: "Reason",
                        backgroundColor:
                            const Color.fromARGB(255, 240, 240, 240),
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 300,
                      ),
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
