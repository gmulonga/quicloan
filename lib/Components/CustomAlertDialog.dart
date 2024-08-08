import 'package:flutter/material.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:quicloan/Utilis/Constants.dart'; // Assuming kDarkTheme1, kNavyBlue, and kCream are defined in Constants.dart

class CustomAlertDialog {
  final BuildContext context;
  final String title;
  final String message;

  CustomAlertDialog({
    required this.context,
    required this.title,
    required this.message,
  });

  void show() {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    final isDarkMode = themeNotifier.isDark;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: DialogTheme(
              backgroundColor: isDarkMode ? kDarkTheme1 : kNavyBlue,
              titleTextStyle: TextStyle(color: kCream, fontSize: 20),
              contentTextStyle: TextStyle(color: kCream),
            ),
          ),
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: kCream),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
