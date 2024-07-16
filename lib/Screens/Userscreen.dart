import 'package:flutter/material.dart';
import 'package:quicloan/Contstants.dart';
import 'package:quicloan/Components/InputField.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/MessageHandler.dart';

class Userspage extends StatefulWidget {
  @override
  State<Userspage> createState() => _UserspageState();
}

class _UserspageState extends State<Userspage> {
  String email = '';
  String name = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: SafeArea(
          child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.person_2_sharp,
                  size: 100,
                  color: kSilver,
                ),
                InputField(
                  label: 'Name',
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
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
                  label: 'Phone Number',
                  integerOnly: true,
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: CustomButton(
                    txtColor: kCream,
                    bgColor: kOrange,
                    callBackFunction: () {
                      setState(() {
                        MessageHandler.showMessage(
                            context, 'Your details have been updated', kOrange);
                      });
                    },
                    label: 'Update Infomation',
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
