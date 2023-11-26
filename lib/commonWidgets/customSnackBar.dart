import 'package:flutter/material.dart';

class CustomSnackBar {
  final String message;

  const CustomSnackBar({
  required this.message,
  });

  static show(
    BuildContext context,
    String message,
    bool error
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
            children: [
             error? Icon(Icons.cancel, color: Colors.red,):Icon(Icons.done, color: Colors.green),
              SizedBox(width: 20,),
              Text(message),
            ],
          ),
       
        action: SnackBarAction(
          textColor: Color(0xFFFAF2FB),
          label: 'ok',
          onPressed: () {},
        ),
      ),
    );
  }
}
