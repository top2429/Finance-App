import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField_icon.dart';
import 'package:tai/features/authentication/presentation/signUp/signUpScreen.dart';
import 'package:tai/features/profile/presentation/editProfileScreen.dart';

import '../../authentication/domain/userNotifier.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  final String email;
  final String image;
  const ProfileScreen(
      {super.key,
      required this.username,
      required this.email,
      required this.image});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text = widget.username;
    emailController.text = widget.email;
    phoneNumberController.text = "--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfileScreen()));
                  },
                  child: SvgPicture.asset("assets/images/edit.svg")),
            )
          ],
          centerTitle: true,
          title: const Text(
            "My Profile",
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 70),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: Image.asset(
                    "assets/images/${widget.image}",
                    fit: BoxFit.cover,
                  ).image,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                      child: Column(
                    children: [
                      TextFieldWidgetIcon(
                        onChanged: (value) {
                          setState(() {});
                        },
                        enabled: false,
                        hasICon: false,
                        controller: usernameController,
                        label: "Username",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidgetIcon(
                        onChanged: (value) {},
                        enabled: false,
                        hasICon: false,
                        controller: emailController,
                        label: "Email",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextFieldWidgetIcon(
                        onChanged: (value) {},
                        enabled: false,
                        hasICon: false,
                        controller: phoneNumberController,
                        label: "Mobile Number",
                        borderSideColor: Colors.transparent,
                        keyBoardType: TextInputType.number,
                      ),
                    ],
                  )),
                ),
                const SizedBox(
                  height: 110,
                ),
                MainButton(
                    text: "Logout",
                    onpressed: () async {
                      await FirebaseAuth.instance.signOut();

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                        (Route<dynamic> route) =>
                            false, // Remove all routes from the stack
                      );
                    }),
                const SizedBox(
                  height: 30,
                ),
                MainButton(red: true, text: "Delete account", onpressed: () {}),
              ],
            ),
          ),
        ));
  }
}
