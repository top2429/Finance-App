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
             error? const Icon(Icons.cancel, color: Colors.red,):const Icon(Icons.done, color: Colors.green),
              const SizedBox(width: 20,),
              SizedBox(
                width: 240,
                child: Text(message, style: const TextStyle(overflow: TextOverflow.ellipsis),)),
            ],
          ),
       
        action: SnackBarAction(
          textColor: const Color(0xFFFAF2FB),
          label: 'ok',
          onPressed: () {},
        ),
      ),
    );
  }
}
