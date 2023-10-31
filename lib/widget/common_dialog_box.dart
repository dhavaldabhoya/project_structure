import 'package:flutter/material.dart';

Future<void> showCommonDialog(BuildContext context,void Function()? onPressed) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Your Dialog Title'),
        content: const Text('Your dialog content goes here.'),
        actions: <Widget>[
          TextButton(
            onPressed:onPressed,
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}