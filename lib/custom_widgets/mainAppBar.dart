import 'package:flutter/material.dart';

 class MainAppBar extends StatefulWidget {
  final String title;
  const MainAppBar({super.key,required this.title});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      );
  }
}