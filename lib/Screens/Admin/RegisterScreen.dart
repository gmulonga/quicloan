import 'package:flutter/material.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/InputField.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Screens/Admin/UserDetails.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';

class Registerscreen extends StatefulWidget {
  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register User',
          style: TextStyle(color: kCream),
        ),
        backgroundColor: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
      ),
      backgroundColor: themeNotifier.isDark ? kDarkTheme2 : kCream,
      body: SafeArea(
          child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'logo',
                  child: Image(
                    image: AssetImage('images/logo.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
                InputField(
                  label: 'Email',
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                InputField(
                  label: 'Password',
                  password: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: CustomButton(
                    txtColor: kCream,
                    bgColor: kOrange,
                    callBackFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Userdetails()),
                      );
                    },
                    label: 'Next',
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
