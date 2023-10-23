import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/custom_widgets/textField.dart';
import 'package:tai/screens/homeCardLinks/Request/splitBills/selectPeople.dart';

class SelectBillAmount extends StatefulWidget {
  const SelectBillAmount({super.key});

  @override
  State<SelectBillAmount> createState() => _SelectBillAmountState();
}

class _SelectBillAmountState extends State<SelectBillAmount> {
  final TextEditingController amount = TextEditingController();
    final TextEditingController purposeOfPayment = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Split",
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
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset("assets/images/lightLine.svg"),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset("assets/images/lightLine.svg"),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset("assets/images/lightLine.svg"),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Select bill",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
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
                        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Card(
                      elevation: 2,
                      child: TextFieldWidget(
                        controller: purposeOfPayment,
                        label: "Purpose of payment",
                        onChanged: (value) {},
                        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                      ),
                    ),
                  ],
                )),
                const Spacer(),
                MainButton(text: "Continue", onpressed: (){
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SelectPeople()));
                })
          ],
        ),
      )),
    );
  }
}
