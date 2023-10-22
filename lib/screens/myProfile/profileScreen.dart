import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/custom_widgets/textField_icon.dart';
import 'package:tai/screens/myProfile/editProfile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController username =
      TextEditingController(text: "Jerry Syre");
  final TextEditingController email =
      TextEditingController(text: "jerrysyre@gmail.com");
  final TextEditingController phoneNumber =
      TextEditingController(text: "05674556454");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileScreen()));
                  },
                  child: SvgPicture.asset("assets/images/edit.svg")),
            )
          ],
          centerTitle: true,
          title: Text(
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
            padding: const EdgeInsets.only(left: 20, right: 20,bottom: 70),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(radius: 50,),
                SizedBox(
                  height: 10,
                ),
                Spacer(),
                Form(
                    child: Column(
                  children: [
                    TextFieldWidgetIcon(
                      onChanged: (value) {
                        setState(() {});
                      },
                      enabled: false,
                      hasICon: false,
                      controller: username,
                      label: "Username",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidgetIcon(
                      onChanged: (value) {},
                      enabled: false,
                      hasICon: false,
                      controller: email,
                      label: "Email",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextFieldWidgetIcon(
                      onChanged: (value) {},
                      enabled: false,
                      hasICon: false,
                      controller: phoneNumber,
                      label: "Mobile Number",
                      borderSideColor: Colors.transparent,
                      keyBoardType: TextInputType.number,
                    ),
                  ],
                )),
                SizedBox(height: 110,),
              MainButton(text: "Logout", onpressed: (){

              }),
              SizedBox(height: 30,),
              MainButton(
                red: true,
                text: "Delete account", onpressed: (){

              }),
              ],
            ),
          ),
        ));
  }
}
