import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Components/InputField.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';

class Userdetails extends StatefulWidget {
  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  String name = '';
  String ID_number = '';
  String phone_number = '';
  String city = '';

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Details',
          style: TextStyle(color: kCream),
        ),
        backgroundColor: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
      ),
      backgroundColor: themeNotifier.isDark ? kDarkTheme2 : kCream,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputField(
                  label: 'Name',
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                InputField(
                  label: 'ID Number',
                  integerOnly: true,
                  onChanged: (value) {
                    setState(() {
                      ID_number = value;
                    });
                  },
                ),
                InputField(
                  label: 'Phone Number',
                  integerOnly: true,
                  onChanged: (value) {
                    setState(() {
                      phone_number = value;
                    });
                  },
                ),
                InputField(
                  label: 'City',
                  onChanged: (value) {
                    setState(() {
                      city = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: CustomButton(
                    txtColor: kCream,
                    bgColor: kOrange,
                    callBackFunction: () {},
                    label: 'Register',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
