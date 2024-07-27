import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/theme_notifier.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loan History',
          style: TextStyle(color: kCream),
        ),
        backgroundColor: kNavyBlue,
      ),
      backgroundColor: themeNotifier.isDark ? kDarkBlue : kCream,
      body: SafeArea(
        child: ListView(
          children: [
            SwitchListTile(
              title: Text('Dark Theme'),
              value: themeNotifier.isDark,
              onChanged: (bool value) {
                themeNotifier.toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
