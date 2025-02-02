import 'package:flutter/material.dart';

enum SnackBarLevel {
  error,
  warning,
  success,
  info,
}

class CustomSnackBar {
  final String title;
  final SnackBarLevel level;

  CustomSnackBar({required this.title, required this.level});

  SnackBar build(BuildContext context) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(title),
      showCloseIcon: true,
      backgroundColor: level == SnackBarLevel.error
          ? Colors.red
          : level == SnackBarLevel.warning
              ? Colors.orange
              : level == SnackBarLevel.success
                  ? Colors.green
                  : Colors.blue,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).size.height - 200,
          right: 20,
          left: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
