import 'package:flutter/material.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/InputField.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Screens/Homescreen.dart';

class Registerscreen extends StatefulWidget {
  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register User',
          style: TextStyle(color: kCream),
        ),
        backgroundColor: kNavyBlue,
      ),
      backgroundColor: kCream,
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
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                    label: 'Register',
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
