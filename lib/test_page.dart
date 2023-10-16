import 'package:flutter/material.dart';
import 'package:tai/custom_widgets/mainButton.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
        
          child: Column(children: [
              SizedBox(height: 200,),
             MainButton(text: "itWorks", onpressed: (){})
          ],),
        ),
      ),
    );
  }
}