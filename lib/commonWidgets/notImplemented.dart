// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NotImplemented extends StatefulWidget {
  const NotImplemented({super.key});

  @override
  State<NotImplemented> createState() => _NotImplementedState();
}

class _NotImplementedState extends State<NotImplemented> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 150,
            ),
            SizedBox(
              height: 50,
            ),
            Text("Not implemented yet")
          ],
        ),
      ),
    );
  }
}
