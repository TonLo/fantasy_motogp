import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    try {
      if (urlSegment == 'signIn') {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (error) {
      const errorMessage = 'Could not authenticate. Pleae try again later.';
      return errorMessage;
    }
  }

  Future<void> login(String email, String password) {
    return _authenticate(email, password, "signIn");
  }

  Future<void> signUp(String email, String password) {
    return _authenticate(email, password, "signUp");
  }
}
