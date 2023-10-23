import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tai/custom_widgets/mainButton.dart';
import 'package:tai/screens/homeCardLinks/Request/splitBills/billDetails.dart';

class SelectPeople extends StatefulWidget {
  const SelectPeople({super.key});

  @override
  State<SelectPeople> createState() => _SelecPeopleState();
}

class _SelecPeopleState extends State<SelectPeople> {
  final TextEditingController person = TextEditingController();

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
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/darkLine.svg"),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset("assets/images/darkLine.svg"),
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
                "Split the bill with ?",
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
                          child: TextFormField(
                            enabled: true,
                            onChanged: (value) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.black, fontSize: 17),
                            controller: person,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 27,
                                ),
                                contentPadding: const EdgeInsets.only(
                                    top: 15, bottom: 15, left: 13),
                                filled: true,
                                fillColor: Colors.white,
                                label: const Text("Search for user to split with"),
                                labelStyle: const TextStyle(color: Colors.grey)
                                //hintText: 'username',

                                ),
                            keyboardType: TextInputType.name,

                            //  keyboardType: TextInputType.name,
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color.fromARGB(255, 240, 240, 240)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Pay for drinks",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "RWF 40,000",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Row(
                          children: [
                            CircleAvatar(),
                            CircleAvatar(),
                            CircleAvatar(),
                            CircleAvatar(),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        MainButton(text: "Split bill", onpressed: (){
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BillDetails()));
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
