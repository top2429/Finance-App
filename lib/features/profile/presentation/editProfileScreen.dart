import 'package:flutter/material.dart';
import 'package:tai/commonWidgets/customSnackBar.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField_icon.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController username =
      TextEditingController(text: "Jerry Syre");
  final TextEditingController email =
      TextEditingController(text: "jerrysyre@gmail.com");
  final TextEditingController phoneNumber =
      TextEditingController(text: "05674556454");

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Edit Profile",
            style: TextStyle(fontSize: 20),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 50,
                    child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              enableDrag: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Column(children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 8, bottom: 14, left: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Select Avatar",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: GridView.builder(
                                      itemBuilder: (context, index) {
                                        return const CircleAvatar();
                                      },
                                      itemCount: 20,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 14,
                                        childAspectRatio: (1.0),
                                      ),
                                    ))
                                  ]),
                                );
                              });
                        },
                        child: const Icon(
                          Icons.add,
                          size: 40,
                        )),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFieldWidgetIcon(
                              onChanged: (value) {},
                              enabled: true,
                              hasICon: true,
                              controller: username,
                              label: "Username *",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFieldWidgetIcon(
                              onChanged: (value) {},
                              enabled: true,
                              hasICon: true,
                              controller: email,
                              label: "Email",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: 110,
                                    height: 56,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextFieldWidgetIcon(
                                      onChanged: (value) {},
                                      enabled: true,
                                      hasICon: true,
                                      controller: phoneNumber,
                                      label: "Mobile Number",
                                      borderSideColor: Colors.transparent,
                                      keyBoardType: TextInputType.number,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                  MainButton(
                      text: "Update",
                      onpressed: () {
                        if (_formKey.currentState!.validate()) {
                          CustomSnackBar.show(context, "Not Implemented", true);
                        }
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
