import 'package:flutter/material.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/InputField.dart';
import 'package:quicloan/Utilis/Constants.dart';
import 'package:quicloan/Utilis/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quicloan/Services/quicloanAPI.dart';
import 'package:quicloan/Components/CustomAlertDialog.dart';

class Registerscreen extends StatefulWidget {
  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  QuicloanAPI api = QuicloanAPI();
  bool showSpinner = false;
  String name = '';
  String email = '';
  String password = '';
  String ID_number = '';
  String phone_number = '';
  String city = '';

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void toggleSpinner(bool value) {
    setState(() {
      showSpinner = value;
    });
  }

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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
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
                      callBackFunction: () async {
                        if (isValidEmail(email)) {
                          if (password.length >= 8) {
                            await api.registerUser(
                              email: email,
                              password: password,
                              context: context,
                              toggleSpinner: toggleSpinner,
                            );
                            setState(() {
                              api.addUser(
                                  name: name,
                                  email: email,
                                  id_number: ID_number,
                                  phone_number: phone_number,
                                  city: city
                              );
                            });
                          } else {
                            CustomAlertDialog(
                              context: context,
                              title: 'Short Password',
                              message: 'The password must be 8 characters long.',
                            ).show();
                          }
                        } else {
                          CustomAlertDialog(
                            context: context,
                            title: 'Invalid Email',
                            message: 'Please enter a valid email address.',
                          ).show();
                        }
                      },
                      label: 'Register',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
