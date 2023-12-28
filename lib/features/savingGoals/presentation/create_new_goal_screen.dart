import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tai/commonWidgets/mainButton.dart';
import 'package:tai/commonWidgets/textField.dart';
import 'package:tai/commonWidgets/textField_PlusSign.dart';


class CreateNewGoalScreen extends StatefulWidget {
  const CreateNewGoalScreen({super.key});

  @override
  State<CreateNewGoalScreen> createState() => _CreateNewGoalScreenState();
}

class _CreateNewGoalScreenState extends State<CreateNewGoalScreen> {
  final _formKey = GlobalKey<FormState>();

  final _goalName = TextEditingController();
  final _amountToSave = TextEditingController();
  final _endDate = TextEditingController();
  // ignore: unused_field
  final _savingCycle = TextEditingController();

  // ignore: unused_field
  String _selectedVal = "Daily";
  
  List _cycleList = [
    "Daily",
    "Weekly",
    "Monthly",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Goal",
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
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Please enter the goal details",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 60,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        onChanged: (p0) {},
                        controller: _goalName,
                        textcolor: Colors.black,
                        label: "Name of the goal",
                        backgroundColor:
                            const Color.fromARGB(255, 240, 240, 240),
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        onChanged: (p0) {},
                        controller: _amountToSave,
                        textcolor: Colors.black,
                        label: "Amount you plan to save",
                        backgroundColor:
                            const Color.fromARGB(255, 240, 240, 240),
                        keyBoardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidgetArrowDown(
                    controller: _endDate,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          helpText: 'Select end date ',
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('EE, d-MM-y').format(pickedDate);

                        setState(() {
                          _endDate.text = formattedDate;
                        });
                      }
                    },
                    label: "Target Date for your goal"),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  
                  dropdownColor: Color.fromARGB(255, 240, 240, 240),
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 15, bottom: 15, left: 13),
                      filled: true,
                      fillColor: Color.fromARGB(255, 240, 240, 240),
                      // errorText:
                      //     widget.controllerExist.isEmpty ? null : widget.controllerExist,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      label: Text("Select your saving cycle"),
                      labelStyle: TextStyle(color: Colors.black)
                      //hintText: 'username',

                      ),
                  items: _cycleList
                      .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),)))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedVal = val as String;
                    });
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.add),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                MainButton(
                    text: "Save",
                    onpressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const Note()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
