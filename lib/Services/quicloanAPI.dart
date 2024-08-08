import 'package:firebase_auth/firebase_auth.dart';

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

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
