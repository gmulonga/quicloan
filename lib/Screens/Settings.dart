import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Text('Settings screen'),
            )
          ],
        ),
      ),
    );
  }
}
