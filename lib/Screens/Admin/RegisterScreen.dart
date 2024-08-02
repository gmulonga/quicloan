import 'package:flutter/material.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/InputField.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Screens/Admin/UserDetails.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quicloan/Components/MessageHandler.dart';

class Registerscreen extends StatefulWidget {
  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String name = '';
  String email = '';
  String password = '';
  String ID_number = '';
  String phone_number = '';
  String city = '';

  bool isValidEmail(String email) {
    // Regular expression for email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: CustomButton(
                        txtColor: kCream,
                        bgColor: kOrange,
                        callBackFunction: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          if (isValidEmail(email)) {
                            if (password.length >= 8) {
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );

                                setState(() {
                                  showSpinner = false;
                                  MessageHandler.showMessage(
                                      context, 'User Registered', kOrange);
                                });
                              } catch (e) {
                                setState(() {
                                  showSpinner = false;
                                });
                                if (e is FirebaseAuthException) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Error'),
                                        content: Text('${e.message}'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            } else {
                              // Show a dialog if the password is less than 8 characters
                              setState(() {
                                showSpinner = false;
                              });
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text(
                                        'Password must be at least 8 characters long'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            // Show a dialog if the email is invalid
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Invalid Email'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
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
        ));
  }
}
