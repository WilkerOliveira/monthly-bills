import 'package:flutter/material.dart';

class MonthlySnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor,
      duration: duration,
      action: action,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void success(BuildContext context, {required String message}) {
    show(context, message: message, backgroundColor: Colors.green);
  }

  static void info(BuildContext context, {required String message}) {
    show(context, message: message, backgroundColor: Colors.blue);
  }

  static void alert(BuildContext context, {required String message}) {
    show(context, message: message, backgroundColor: Colors.orange);
  }

  static void error(BuildContext context, {required String message}) {
    show(context, message: message, backgroundColor: Colors.red);
  }
}
