import 'package:flutter/material.dart';

class CustomSnackBar {
  static show(BuildContext context, String message, bool error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 100, left: 10, right: 10),
        content: Row(
          children: [
            error
                ? const Icon(
                    Icons.cancel,
                    color: Colors.red,
                  )
                : const Icon(Icons.done, color: Colors.green),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
                width: 260,
                child: Text(
                  message,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                )),
          ],
        ),

      
      ),
    );
  }
}