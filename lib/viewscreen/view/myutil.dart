import 'package:flutter/material.dart';

class MyUtil {
  static void showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 8),
      content: Text(message),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
