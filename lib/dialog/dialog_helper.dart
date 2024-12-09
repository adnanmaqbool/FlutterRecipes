import 'package:flutter/material.dart';

class DialogHelper {
  // Static method to show exit confirmation dialog
  static Future<bool> showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Exit"),
        content: Text("Are you sure you want to exit the application?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("No"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("Yes"),
          ),
        ],
      ),
    ) ?? false;
  }
}
