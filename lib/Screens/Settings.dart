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
        title: const Text(
          'Settings',
          style: TextStyle(color: kCream),
        ),
        backgroundColor: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
      ),
      backgroundColor: themeNotifier.isDark ? kDarkTheme2 : kCream,
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
