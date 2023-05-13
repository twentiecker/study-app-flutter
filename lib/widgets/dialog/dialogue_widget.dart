import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Hi...',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text('Please login before you start')
        ],
      ),
      actions: [Padding(
        padding: const EdgeInsets.only(right: 10),
        child: TextButton(onPressed: onTap, child: const Text("Confirm")),
      )],
    );
  }
}
