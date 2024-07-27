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
      // backgroundColor: themeNotifier.isDark ? kNavyBlue : kCream,
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Text('Settings screen'),
            ),
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
