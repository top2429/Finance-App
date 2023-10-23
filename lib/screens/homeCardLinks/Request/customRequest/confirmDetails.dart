import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/custom_widgets/textField.dart';
import 'package:tai/custom_widgets/textField_icon.dart';

class ConfirmDetails extends StatefulWidget {
  const ConfirmDetails({super.key});

  @override
  State<ConfirmDetails> createState() => _ConfirmDetailsState();
}

class _ConfirmDetailsState extends State<ConfirmDetails> {
  final TextEditingController recipientName =
      TextEditingController(text: "jerry syre");
  final TextEditingController reason = TextEditingController(text: "none");
  final TextEditingController amount = TextEditingController(text: "200,000");

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Confirm Details",
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
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/darkLine.svg"),
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset("assets/images/darkLine.svg"),
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset("assets/images/darkLine.svg"),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldWidgetIcon(
                          hasICon: true,
                          enabled: true,
                          controller: recipientName,
                          label: "Recipient's name",
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFieldWidgetIcon(
                          hasICon: true,
                          enabled: true,
                          controller: reason,
                          label: "Reason",
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFieldWidgetIcon(
                          hasICon: true,
                          enabled: true,
                          controller: amount,
                          label: "Amount",
                          onChanged: (value) {},
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 230,
              ),
              MainButton(text: "Send request", onpressed: () {}),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      )),
    );
  }
}
