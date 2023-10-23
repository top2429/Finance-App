import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/custom_widgets/textField.dart';
import 'package:tai/screens/homeCardLinks/Request/customRequest/confirmDetails.dart';

class EnterAmount extends StatefulWidget {
  const EnterAmount({super.key});

  @override
  State<EnterAmount> createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  final TextEditingController amount = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New Request",
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
        padding: const EdgeInsets.only(left: 20,right: 20, bottom: 50,top:20),
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
                SvgPicture.asset("assets/images/lightLine.svg"),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "How much do you request",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      child: TextFieldWidget(
                        controller: amount,
                        label: "Enter Amount",
                        onChanged: (value) {},
                        backgroundColor: Color.fromARGB(255, 240, 240, 240),
                      ),
                    ),
                    SizedBox(height: 20,),
                    
                  ],
                )),
                Spacer(),
                MainButton(text: "Continue", onpressed: (){
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConfirmDetails()));
                })
          ],
        ),
      )),
    );
  }
}
