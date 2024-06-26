// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomSnackBar {
  static show(BuildContext context, String message, bool error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        content: Row(
          children: [
            error
                ? const Icon(
                    Icons.cancel,
                    color: Colors.red,
                  )
                : const Icon(Icons.done, color: Colors.green),
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
