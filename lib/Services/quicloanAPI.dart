import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quicloan/Components/CustomAlertDialog.dart';
import 'package:quicloan/Components/MessageHandler.dart';
import 'package:quicloan/Utilis/Constants.dart';

class QuicloanAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    try {
      return _auth.currentUser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required BuildContext context,
    required Function(bool) toggleSpinner,
  }) async {
    try {
      toggleSpinner(true); // Show spinner
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      toggleSpinner(false);
      MessageHandler.showMessage(
          context, 'User Registered', kOrange);
    } catch (e) {
      toggleSpinner(false);
      if (e is FirebaseAuthException) {
        CustomAlertDialog(
          context: context,
          title: 'Error',
          message: '${e.message}',
        ).show();
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

}
