import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authenticate with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> _authenticate(
      String email, String password, String username, String urlSegment) async {
    try {
      if (urlSegment == 'signIn') {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await db.collection('users').doc(auth.currentUser.uid).set({
          'email': email,
          'username': username,
        });
      }
    } catch (error) {
      const errorMessage = 'Could not authenticate. Pleae try again later.';
      return errorMessage;
    }
  }

  Future<void> login(String email, String username, String password) async {
    return _authenticate(email, password, username, "signIn");
  }

  Future<void> signUp(String email, String password, String username) {
    return _authenticate(email, password, username, "signUp");
  }

  String getUser() {
    return auth.currentUser.uid;
  }
}
