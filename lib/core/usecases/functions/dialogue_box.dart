import 'package:flutter/material.dart';

void showCustomDialog(
    BuildContext context, VoidCallback onpress, String title, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: onpress,
            child: Text("Yes"),
          ),
        ],
      );
    },
  );
}
