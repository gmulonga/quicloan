import 'package:flutter/material.dart';
import 'package:quicloan/Utilis/Constants.dart';
import 'package:quicloan/Components/InputField.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Screens/Homescreen.dart';
import 'package:provider/provider.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quicloan/Components/CustomAlertDialog.dart';

class Loginscreen extends StatefulWidget {
  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool showSpinner = false;

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
        backgroundColor: themeNotifier.isDark ? kDarkTheme2 : kCream,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SafeArea(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Hero(
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
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: CustomButton(
                          txtColor: kCream,
                          bgColor: kOrange,
                          callBackFunction: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            if (isValidEmail(email)) {
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                                Navigator.pushNamed(context, '/homePage');

                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                setState(() {
                                  showSpinner = false;
                                });
                                if (e is FirebaseAuthException) {
                                  // Check specific error codes
                                  if (e.code == 'network-request-failed') {
                                    CustomAlertDialog(
                                      context: context,
                                      title: 'Network Error !',
                                      message:
                                          'Please check your internet connection',
                                    ).show();
                                  } else if (e.code == 'invalid-credential') {
                                    CustomAlertDialog(
                                      context: context,
                                      title: 'Error !',
                                      message:
                                          'Invalid Credentials',
                                    ).show();
                                  } else {
                                    CustomAlertDialog(
                                      context: context,
                                      title: 'Error!',
                                      message: '${e.message}',
                                    ).show();
                                  }
                                }
                              }
                            } else {
                              setState(() {
                                showSpinner = false;
                              });
                              CustomAlertDialog(
                                context: context,
                                title: 'Error !',
                                message: 'Invalid Email',
                              ).show();
                            }
                          },
                          label: 'Login',
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()),
                              );
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                color:
                                    themeNotifier.isDark ? kCream : kNavyBlue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
