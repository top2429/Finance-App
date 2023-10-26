import 'package:flutter/material.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:pin_plus_keyboard/package/pin_plus_keyboard_package.dart';

class KeyBoard extends StatefulWidget {
  const KeyBoard({super.key});

  @override
  State<KeyBoard> createState() => _KeyBoard2State();
}

class _KeyBoard2State extends State<KeyBoard> {
  TextEditingController controller = TextEditingController();
  PinInputController pinInputController = PinInputController(length: 6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100,top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Create Password", style: TextStyle(color: Colors.white,fontSize: 23),),
            PinPlusKeyBoardPackage(
              keyboardFontSize: 25,
              inputBorderColor: Colors.grey,
              backButton: const Icon(Icons.cancel,color: Colors.white,),
              doneButton: const Icon(Icons.done,color: Color(0xFF466AE7),size: 30,),
              inputTextColor: const Color(0xFF466AE7),
              btnTextColor: Colors.white,
              inputType: InputType.dash,
              inputHasBorder: false,
              btnHasBorder: false,
              keyboardButtonShape: KeyboardButtonShape.circular,
              spacing: 100,
              pinInputController: pinInputController,
              onSubmit: () {
                /// ignore: avoid_print
                print("Text is : ${pinInputController.text}");
              },
              keyboardFontFamily: 'Ubuntu',
            ),
          ],
        ),
      ),
    );
  }
}
