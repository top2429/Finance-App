import 'package:flutter/material.dart';

class NotImplemented extends StatefulWidget {
  const NotImplemented({super.key});

  @override
  State<NotImplemented> createState() => _NotImplementedState();
}

class _NotImplementedState extends State<NotImplemented> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              color: const Color.fromARGB(255, 0, 0, 0),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
        ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 150,),
            SizedBox(height: 50,),
            Text("Not implemented yet")
          ],
        ),
      ),
    );
  }
}